function Add-Theme {
    [cmdletbinding(DefaultParameterSetName = 'Path', SupportsShouldProcess)]
    param(
        [Parameter(
            Mandatory,
            ParameterSetName  = 'Path',
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string[]]$Path,

        [Parameter(
            Mandatory,
            ParameterSetName = 'LiteralPath',
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('PSPath')]
        [string[]]$LiteralPath,

        [switch]$Force,

        [ValidateSet('Color', 'Icon')]
        [Parameter(Mandatory)]
        [string]$Type
    )

    process {
        # Resolve path(s)
        if ($PSCmdlet.ParameterSetName -eq 'Path') {
            $paths = Resolve-Path -Path $Path | Select-Object -ExpandProperty Path
        } elseif ($PSCmdlet.ParameterSetName -eq 'LiteralPath') {
            $paths = Resolve-Path -LiteralPath $LiteralPath | Select-Object -ExpandProperty Path
        }

        foreach ($resolvedPath in $paths) {
            if (Test-Path $resolvedPath) {
                $item = Get-Item -LiteralPath $resolvedPath

                $statusMsg  = "Adding $($type.ToLower()) theme [$($item.BaseName)]"
                $confirmMsg = "Are you sure you want to add file [$resolvedPath]?"
                $operation  = "Add $($Type.ToLower())"
                if ($PSCmdlet.ShouldProcess($statusMsg, $confirmMsg, $operation) -or $Force.IsPresent) {
                    if (-not $script:current.Themes.$Type.ContainsKey($item.BaseName) -or $Force.IsPresent) {

                        $theme = Import-PowerShellDataFile $item.FullName

                        # Convert color theme into escape sequences for lookup later
                        if ($Type -eq 'Color') {
                            # Add empty color theme
                            if (-not $script:colorSequences.ContainsKey($theme.Name)) {
                                $script:colorSequences[$theme.Name] = New-EmptyColorTheme
                            }

                            # Directories
                            $theme.Types.Directories.WellKnown.GetEnumerator().ForEach({
                                $script:colorSequences[$theme.Name].Types.Directories[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
                            })
                            # Wellknown files
                            $theme.Types.Files.WellKnown.GetEnumerator().ForEach({
                                $script:colorSequences[$theme.Name].Types.Files.WellKnown[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
                            })
                            # File extensions
                            $theme.Types.Files.GetEnumerator().Where({$_.Name -ne 'WellKnown'}).ForEach({
                                $script:colorSequences[$theme.Name].Types.Files[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
                            })
                        }

                        $script:current.Themes.$Type[$theme.Name] = $theme
                        Save-Theme -Theme $theme -Type $Type
                    } else {
                        Write-Error "$Type theme [$($theme.Name)] already exists. Use the -Force switch to overwrite."
                    }
                }
            } else {
                Write-Error "Path [$resolvedPath] is not valid."
            }
        }
    }
}
