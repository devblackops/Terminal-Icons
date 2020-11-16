# Taken with love from @juneb_get_help (https://raw.githubusercontent.com/juneb/PesterTDD/master/Module.Help.Tests.ps1)

Describe 'Help' {
    $testCases = Get-Command -Module $env:BHProjectName -CommandType Cmdlet, Function | ForEach-Object {
        @{
            Name    = $_.Name
            Command = $_
        }
    }

    BeforeAll {
        $commonParameters = 'Debug', 'ErrorAction', 'ErrorVariable', 'InformationAction', 'InformationVariable', 'OutBuffer',
                            'OutVariable', 'PipelineVariable', 'Verbose', 'WarningAction', 'WarningVariable', 'Confirm', 'Whatif'
    }

    # No auto-generated help
    Context 'Auto-generation' {
        it 'Help for [<Name>] should not be auto-generated' -TestCases $testCases {
            param($Name, $Command)

            $help = Get-Help $Name -ErrorAction SilentlyContinue
            $help.Synopsis | Should -Not -BeLike '*`[`<CommonParameters`>`]*'
        }
    }


    # Should have a description for every function
    Context 'Help description' {
        It 'Help for [<Name>] has a description' -TestCases $testCases {
            param($Name, $Command)

            $help = Get-Help $Name -ErrorAction SilentlyContinue
            $help.Description | Should -Not -BeNullOrEmpty
        }
    }

    # Should be at least one example per command
    Context 'Examples' {
        It 'Help for [<Name>] has example code' -TestCases $testCases {
            param($Name, $Command)

            $help = Get-Help $Name -ErrorAction SilentlyContinue
            ($help.Examples.Example | Select-Object -First 1).Code | Should -Not -BeNullOrEmpty
        }
    }

    # Parameter help
    Context 'Parameter help' {
        It '[<Name>] has help for every parameter' -TestCases $testCases {
            param($Name, $Command)

            $help = Get-Help $Name -ErrorAction SilentlyContinue
            $parameters = $Command.ParameterSets.Parameters |
                Sort-Object -Property Name -Unique |
                Where-Object { $_.Name -notin $commonParameters }
            $parameterNames = $parameters.Name

            # Without the filter, WhatIf and Confirm parameters are still flagged in "finds help parameter in code" test
            $helpParameters = $help.Parameters.Parameter |
                Where-Object { $_.Name -notin $commonParameters } |
                Sort-Object -Property Name -Unique
            $helpParameterNames = $helpParameters.Name

            foreach ($parameter in $parameters) {
                $parameterName = $parameter.Name
                $parameterHelp = $help.parameters.parameter | Where-Object Name -eq $parameterName
                $parameterHelp.Description.Text | Should -Not -BeNullOrEmpty

                $codeMandatory = $parameter.IsMandatory.toString()
                $parameterHelp.Required | Should -Be $codeMandatory

                $codeType = $parameter.ParameterType.Name
                # To avoid calling Trim method on a null object.
                $helpType = if ($parameterHelp.parameterValue) { $parameterHelp.parameterValue.Trim() }
                $helpType | Should -Be $codeType
            }
        }
    }

    # Links are valid
    Context 'Links' {
        It 'Help for [<Name>] has valid links' -TestCases $testCases  {
            param($Name, $Command)

            $help = Get-Help $Name -ErrorAction SilentlyContinue
            $link = $help.relatedLinks.navigationLink.uri
            foreach ($link in $links) {
                $Results = Invoke-WebRequest -Uri $link -UseBasicParsing
                $Results.StatusCode | Should -Be '200'
            }
        }
    }
}
