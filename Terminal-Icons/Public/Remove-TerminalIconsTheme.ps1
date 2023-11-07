function Remove-TerminalIconsTheme {
    <#
    .SYNOPSIS
        Removes a color or icon theme
    .DESCRIPTION
        Removes a given icon or color theme. In order to be removed, a theme must not be active.
    .PARAMETER IconTheme
        The icon theme to remove.
    .PARAMETER ColorTheme
        The color theme to remove.
    .PARAMETER Force
        Bypass confirmation messages.
    .EXAMPLE
        PS> Remove-TerminalIconsTheme -IconTheme MyAwesomeTheme

        Removes the icon theme 'MyAwesomeTheme'
    .EXAMPLE
        PS> Remove-TerminalIconsTheme -ColorTheme MyAwesomeTheme

        Removes the color theme 'MyAwesomeTheme'
    .INPUTS
        System.String

        The name of the color or icon theme to remove.
    .OUTPUTS
        None.
    .LINK
        Set-TerminalIconsTheme
    .LINK
        Add-TerminalIconsColorTheme
    .LINK
        Add-TerminalIconsIconTheme
    .LINK
        Get-TerminalIconsTheme
    .NOTES
        A theme must not be active in order to be removed.
    #>
    [cmdletbinding(SupportsShouldProcess)]
    param(
        [ArgumentCompleter({
            (Get-TerminalIconsIconTheme).Keys | Sort-Object
        })]
        [string]$IconTheme,

        [ArgumentCompleter({
            (Get-TerminalIconsColorTheme).Keys | Sort-Object
        })]
        [string]$ColorTheme,

        [Parameter(DontShow)]
        [hashtable]$CurrentSettings = $script:current,

        [switch]$Force
    )

    $currentTheme     = Get-TerminalIconsTheme
    $themeStoragePath = Get-ThemeStoragePath

    if ($ColorTheme) {
        if ($currentTheme.Color.Name -ne $ColorTheme) {
            $themePath = Join-Path $themeStoragePath "$($ColorTheme)_color.xml"
            if (-not (Test-Path $themePath)) {
                Write-Error "Could not find theme file [$themePath]"
            } else {
                if ($Force -or $PSCmdlet.ShouldProcess($ColorTheme, 'Remove color theme')) {
                    if ($CurrentSettings.Themes.Color.ContainsKey($ColorTheme)) {
                        $CurrentSettings.Themes.Color.Remove($ColorTheme)
                    } else {
                        # We shouldn't be here
                        Write-Error "Color theme [$ColorTheme] is not registered."
                    }
                    Remove-Item $themePath -Force
                }
            }
        } else {
            Write-Error ("Color theme [{0}] is active. Please select another theme before removing this it." -f $ColorTheme)
        }
    }

    if ($IconTheme) {
        if ($currentTheme.Icon.Name -ne $IconTheme) {
            $themePath = Join-Path $themeStoragePath "$($IconTheme)_icon.xml"
            if (-not (Test-Path $themePath)) {
                Write-Error "Could not find theme file [$themePath]"
            } else {
                if ($Force -or $PSCmdlet.ShouldProcess($ColorTheme, 'Remove icon theme')) {
                    if ($CurrentSettings.Themes.Icon.ContainsKey($IconTheme)) {
                        $CurrentSettings.Themes.Icon.Remove($IconTheme)
                    } else {
                        # We shouldn't be here
                        Write-Error "Icon theme [$IconTheme] is not registered."
                    }
                    Remove-Item $themePath -Force
                }
            }
        } else {
            Write-Error ("Icon theme [{0}] is active. Please select another theme before removing this it." -f $IconTheme)
        }
    }
}
