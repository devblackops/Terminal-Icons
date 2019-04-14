
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
$currentTheme = Import-Configuration
if ($currentTheme.Keys.Count -eq 0) {
    Write-Warning 'No Terminal-Icons theme set. Using default [Jaykul]...'
    $currentTheme = @{
        Color = $colorThemes.Jaykul
        Icon  = $iconThemes.Jaykul
    }
}
$currentTheme | Export-Configuration

Export-ModuleMember -Function $public.Basename

Update-FormatData -Prepend (Join-Path $PSScriptRoot 'Terminal-Icons.format.ps1xml')
