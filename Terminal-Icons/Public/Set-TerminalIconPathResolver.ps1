function Set-TerminalIconPathResolver {
    <#
    .SYNOPSIS
        Set the path resolver for processing symbol's target before displaying.
    .DESCRIPTION
        Set the path resolver for processing symbol's target before displaying.
    .PARAMETER Resolver
        The path resolver to set.
    .EXAMPLE
        PS> Set-TerminalIconPathResolver -Resolver { param($Path) $Path.Replace($HOME, '~') }

        Set the path resolver to replace the home directory with '~'.
    .INPUTS
        ScriptBlock

        You can pipe a scriptblock to this function.
    .OUTPUTS
        None.
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '', Justification='Implemented in private function')]
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(
            Mandatory,
            ValueFromPipeline
        )]
        [AllowNull()]
        [scriptblock]$Resolver
    )

    process {
        Set-PathResolver -Resolver $Resolver
    }
}
