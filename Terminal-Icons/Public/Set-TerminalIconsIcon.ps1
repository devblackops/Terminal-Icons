function Set-TerminalIconsIcon {
    <#
    .SYNOPSIS
        Set a specific icon in the current Terminal-Icons icon theme or allows
        swapping one glyph for another.
    .DESCRIPTION
        Set the Terminal-Icons icon for a specific file/directory or glyph to a
        named glyph.

        Also allows all uses of a specific glyph to be replaced with a different
        glyph.
    .PARAMETER Directory
        The well-known directory name to match for the icon.
    .PARAMETER FileName
        The well-known file name to match for the icon.
    .PARAMETER FileExtension
        The file extension to match for the icon.
    .PARAMETER NewGlyph
        The name of the new glyph to use when swapping.
    .PARAMETER Glyph
        The name of the glyph to use; or, when swapping glyphs, the name of the
        glyph you want to change.
    .PARAMETER Force
        Bypass confirmation messages.
    .EXAMPLE
        PS> Set-TerminalIconsIcon -FileName "README.md" -Glyph "nf-fa-file_text"

        Set README.md files to display a text file icon.
    .EXAMPLE
        PS> Set-TerminalIconsIcon -FileExtension ".xml" -Glyph "nf-md-xml"

        Set XML files to display an XML file icon.
    .EXAMPLE
        PS> Set-TerminalIconsIcon -Directory ".github" -Glyph "nf-dev-github_alt"

        Set directories named ".github" to display an Octocat face icon.
    .EXAMPLE
        PS> Set-TerminalIconsIcon -Glyph "nf-md-xml" -NewGlyph "nf-md-xml"

        Changes all uses of the "nf-md-xml" double-wide glyph to be the "nf-md-xml"
        single-width XML file glyph.
    .INPUTS
        None.

        The command does not accept pipeline input.
    .OUTPUTS
        None.
    .LINK
        Get-TerminalIconsIconTheme
    .LINK
        Get-TerminalIconsTheme
    .LINK
        Get-TerminalIconsGlyphs
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '', Justification = "ArgumentCompleter parameters don't all get used.")]
    [cmdletbinding(SupportsShouldProcess, DefaultParameterSetName = "FileExtension")]
    param(
        [Parameter(ParameterSetName = "Directory", Mandatory)]
        [ArgumentCompleter( {
                param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
                (Get-TerminalIconsIconTheme).Values.Types.Directories.WellKnown.Keys | Where-Object { $_ -like "$wordToComplete*" } | Sort-Object
            })]
        [ValidateNotNullOrEmpty()]
        [string]$Directory,

        [Parameter(ParameterSetName = "FileName", Mandatory)]
        [ArgumentCompleter( {
                param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
                (Get-TerminalIconsIconTheme).Values.Types.Files.WellKnown.Keys | Where-Object { $_ -like "$wordToComplete*" } | Sort-Object
            })]
        [ValidateNotNullOrEmpty()]
        [string]$FileName,

        [Parameter(ParameterSetName = "FileExtension", Mandatory)]
        [ArgumentCompleter( {
                param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
                (Get-TerminalIconsIconTheme).Values.Types.Files.Keys | Where-Object { $_.StartsWith(".") -and $_ -like "$wordToComplete*" } | Sort-Object
            })]
        [ValidatePattern("^\.")]
        [string]$FileExtension,

        [Parameter(ParameterSetName = "SwapGlyph", Mandatory)]
        [ArgumentCompleter( {
                param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
                (Get-TerminalIconsGlyphs).Keys | Where-Object { $_ -like "*$wordToComplete*" } | Sort-Object
            })]
        [ValidateNotNullOrEmpty()]
        [string]$NewGlyph,

        [Parameter(Mandatory)]
        [ArgumentCompleter( {
                param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
                (Get-TerminalIconsGlyphs).Keys | Where-Object { $_ -like "*$wordToComplete*" } | Sort-Object
            })]
        [ValidateNotNullOrEmpty()]
        [string]$Glyph,

        [switch]$Force
    )

    If($PSCmdlet.ParameterSetName -eq "Directory") {
        If ($Force -or $PSCmdlet.ShouldProcess("$Directory = $Glyph", 'Set well-known directory icon')) {
            (Get-TerminalIconsIconTheme).Values.Types.Directories.WellKnown[$Directory] = $Glyph
        }
    }
    ElseIf ($PSCmdlet.ParameterSetName -eq "FileName") {
        If ($Force -or $PSCmdlet.ShouldProcess("$FileName = $Glyph", 'Set well-known file name icon')) {
            (Get-TerminalIconsIconTheme).Values.Types.Files.WellKnown[$FileName] = $Glyph
        }
    }
    ElseIf ($PSCmdlet.ParameterSetName -eq "FileExtension") {
        If ($Force -or $PSCmdlet.ShouldProcess("$FileExtension = $Glyph", 'Set file extension icon')) {
            (Get-TerminalIconsIconTheme).Values.Types.Files[$FileExtension] = $Glyph
        }
    }
    ElseIf ($PSCmdlet.ParameterSetName -eq "SwapGlyph") {
        If ($Force -or $PSCmdlet.ShouldProcess("$Glyph to $NewGlyph", 'Swap glyph usage')) {
            # Directories
            $toModify = (Get-TerminalIconsTheme).Icon.Types.Directories.WellKnown
            $keys = $toModify.Keys | Where-Object { $toModify[$_] -eq $Glyph }
            $keys | ForEach-Object { $toModify[$_] = $NewGlyph }

            # Files
            $toModify = (Get-TerminalIconsTheme).Icon.Types.Files.WellKnown
            $keys = $toModify.Keys | Where-Object { $toModify[$_] -eq $Glyph }
            $keys | ForEach-Object { $toModify[$_] = $NewGlyph }

            # Extensions
            $toModify = (Get-TerminalIconsTheme).Icon.Types.Files
            $keys = $toModify.Keys | Where-Object { $_.StartsWith(".") -and $toModify[$_] -eq $Glyph }
            $keys | ForEach-Object { $toModify[$_] = $NewGlyph }
        }
    }
}
