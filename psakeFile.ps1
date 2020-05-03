properties {
    # Disable "compiling" module into monolithinc PSM1.
    # This modifies the default behavior from the "Build" task
    # in the PowerShellBuild shared psake task module
    $PSBPreference.Build.CompileModule = $false
    $PSBPreference.Build.CompileModule = $false
    $PSBPreference.Test.OutputFile     = "$($PSBPreference.Build.OutDir)/testResults.xml"
}

task default -depends Test

task Pester -FromModule PowerShellBuild -Version '0.4.0' -preaction {$script:modPath = $PSBPreference.General.ModuleManifestPath; Import-Module $script:modPath}
