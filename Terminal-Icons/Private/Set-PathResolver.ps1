function Set-PathResolver {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [AllowNull()]
        [scriptblock]$Resolver
    )

    if(-not $PathResolver) {
        $script:PathResolver = {
            param($Path)
            $Path
        }
    }
    else{
        $script:PathResolver = $Resolver
    }
}
