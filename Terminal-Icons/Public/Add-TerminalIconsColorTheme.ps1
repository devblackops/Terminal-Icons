function Add-TerminalIconsColorTheme {
    <#
    .SYNOPSIS
        Add a Terminal-Icons color theme for the current user.
    .DESCRIPTION
        Add a Terminal-Icons color theme for the current user. The theme data
        is stored in the user's profile
    .PARAMETER Path
        The path to the Terminal-Icons color theme file.
    .PARAMETER LiteralPath
        The literal path to the Terminal-Icons color theme file.
    .PARAMETER Force
        Overwrite the color theme if it already exists in the profile.
    .EXAMPLE
        PS> Add-TerminalIconsColorTheme -Path ./my_color_theme.psd1

        Add the color theme contained in ./my_color_theme.psd1.
    .EXAMPLE
        PS> Get-ChildItem ./path/to/colorthemes | Add-TerminalIconsColorTheme -Force

        Add all color themes contained in the folder ./path/to/colorthemes and add them,
        overwriting existing ones if needed.
    .INPUTS
        System.String

        You can pipe a string that contains a path to 'Add-TerminalIconsColorTheme'.
    .OUTPUTS
        None.
    .NOTES
        'Add-TerminalIconsColorTheme' will not overwrite an existing theme by default.
        Add the -Force switch to overwrite.
    .LINK
        Add-TerminalIconsIconTheme
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
        Add-Theme @PSBoundParameters -Type Color
    }
}
