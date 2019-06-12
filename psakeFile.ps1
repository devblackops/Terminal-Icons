properties {
    # Disable "compiling" module into monolithinc PSM1.
    # This modifies the default behavior from the "Build" task
    # in the PowerShellBuild shared psake task module
    $PSBPreference.Build.CompileModule = $false
}

task default -depends Test

task Pester -FromModule PowerShellBuild -Version '0.3.1' -preaction {$script:modPath = $PSBPreference.General.ModuleManifestPath; Import-Module $script:modPath}
