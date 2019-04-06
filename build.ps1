[cmdletbinding(DefaultParameterSetName = 'Task')]
param(
    # Build task(s) to execute
    [parameter(ParameterSetName = 'task', position = 0)]
    [string[]]$Task = 'default',

    # Bootstrap dependencies
    [switch]$Bootstrap,

    # List available build tasks
    [parameter(ParameterSetName = 'Help')]
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

# Bootstrap dependencies
if ($Bootstrap.IsPresent) {
    Get-PackageProvider -Name Nuget -ForceBootstrap | Out-Null
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
    if (-not (Get-Module -Name PSDepend -ListAvailable)) {
        Install-module -Name PSDepend -Repository PSGallery
    }
    Import-Module -Name PSDepend -Verbose:$false
    Invoke-PSDepend -Path './requirements.psd1' -Install -Import -Force -WarningAction SilentlyContinue
}

# Execute psake task(s)
$psakeFile = './psakeFile.ps1'
if ($PSCmdlet.ParameterSetName -eq 'Help') {
    Get-PSakeScriptTasks -buildFile $psakeFile  |
        Format-Table -Property Name, Description, Alias, DependsOn
} else {
    Set-BuildEnvironment -Force

    Invoke-psake -buildFile $psakeFile -taskList $Task -nologo
    exit ( [int]( -not $psake.build_success ) )
}
