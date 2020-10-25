function Add-TerminalIconsIconTheme {
    <#
    .SYNOPSIS
        Add a Terminal-Icons icon theme for the current user.
    .DESCRIPTION
        Add a Terminal-Icons icon theme for the current user. The theme data
        is stored in the user's profile
    .PARAMETER Path
        The path to the Terminal-Icons icon theme file.
    .PARAMETER LiteralPath
        The literal path to the Terminal-Icons icon theme file.
    .PARAMETER Force
        Overwrite the icon theme if it already exists in the profile.
    .EXAMPLE
        PS> Add-Terminal-IconsIconTHeme -Path ./my_icon_theme.psd1

        Add the icon theme contained in ./my_icon_theme.psd1.
    .EXAMPLE
        PS> Get-ChildItem ./path/to/iconthemes | Add-TerminalIconsIconTheme -Force

        Add all icon themes contained in the folder ./path/to/iconthemes and add them,
        overwriting existing ones if needed.
    .INPUTS
        System.String

        You can pipe a string that contains a path to 'Add-TerminalIconsIconTheme'.
    .OUTPUTS
        None.
    .NOTES
        'Add-TerminalIconsIconTheme' will not overwrite an existing theme by default.
        Add the -Force switch to overwrite.
    .LINK
        Add-TerminalIconsColorTheme
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '', Justification='Implemented in private function')]
    [CmdletBinding(DefaultParameterSetName = 'Path', SupportsShouldProcess)]
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

        [switch]$Force
    )

    process {
        Add-Theme @PSBoundParameters -Type Icon
    }
}
