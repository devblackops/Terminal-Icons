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

# Import theme files
$colorThemes = @{}
(Get-ChildItem -Path $PSScriptRoot/data/colorThemes).Foreach({
    $colorThemes.Add($_.Basename, (Import-PowerShellDataFile -Path $_))
})
$iconThemes = @{}
(Get-ChildItem -Path $PSScriptRoot/data/iconThemes).Foreach({
    $iconThemes.Add($_.Basename, (Import-PowerShellDataFile -Path $_))
})

# Import current themes
$currentTheme = @{
    color = $colorThemes.jaykul
    icon  = $iconThemes.jaykul
}

$icons = @{}
(. $PSScriptRoot/data/icons.ps1).GetEnumerator().ForEach({
    $icons[$_.Name] = [char][int]('0x' + $_.Value)
})

Export-ModuleMember -Function $public.Basename

Update-FormatData -Prepend (Join-Path $PSScriptRoot 'Terminal-Icons.format.ps1xml')
