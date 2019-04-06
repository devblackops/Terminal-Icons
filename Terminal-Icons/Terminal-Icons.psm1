# Dot source public/private functions
$public  = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'public/*.ps1')  -Recurse -ErrorAction Stop)
$private = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'private/*.ps1') -Recurse -ErrorAction Stop)
@($public + $private).ForEach({
    try {
        . $_.FullName
    } catch {
        throw $_
        $PSCmdlet.ThrowTerminatingError("Unable to dot source [$($import.FullName)]")
    }
})

$color = . $PSScriptRoot/data/colors.ps1

$icons = @{}
(. $PSScriptRoot/data/icons.ps1).GetEnumerator().ForEach({
    $icons[$_.Name] = [char][int]('0x' + $_.Value)
})

$mappings = . $PSScriptRoot/data/fileExtensionMappings.ps1

Export-ModuleMember -Function $public.Basename

Update-FormatData -Prepend (Join-Path $PSScriptRoot 'Terminal-Icons.format.ps1xml')
