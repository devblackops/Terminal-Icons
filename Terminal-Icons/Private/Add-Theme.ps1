function Add-Theme {
    [cmdletbinding(DefaultParameterSetName = 'Path', SupportsShouldProcess)]
    param(
        [parameter(
            Mandatory,
            ParameterSetName  = 'Path',
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string[]]$Path,

        [parameter(
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
        [parameter(mandatory)]
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
                    if (-not $themeData.Themes.$Type.ContainsKey($item.BaseName) -or $Force.IsPresent) {

                        # Convert color theme into escape sequences for lookup later
                        if ($Type -eq 'Color') {
                            $colorData = ConvertFrom-Psd1 $item.FullName
                            # Directories
                            $colorData.Types.Directories.WellKnown.GetEnumerator().ForEach({
                                $script:colorSequences[$item.BaseName].Types.Directories[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
                            })
                            # Wellknown files
                            $colorData.Types.Files.WellKnown.GetEnumerator().ForEach({
                                $script:colorSequences[$item.BaseName].Types.Files.WellKnown[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
                            })
                            # File extensions
                            $colorData.Types.Files.GetEnumerator().Where({$_.Name -ne 'WellKnown'}).ForEach({
                                $script:colorSequences[$item.BaseName].Types.Files[$_.Name] = ConvertFrom-RGBColor -RGB $_.Value
                            })
                        }

                        $colorData = ConvertFrom-Psd1 $item.FullName
                        $themeData.Themes.$Type[$item.Basename] = $colorData
                        Save-Theme -Theme $themeData
                    } else {
                        Write-Error "$Type theme [$($item.BaseName)] already exists. Use the -Force switch to overwrite."
                    }
                }
            } else {
                Write-Error "Path [$resolvedPath] is not valid."
            }
        }
    }
}
