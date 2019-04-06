properties {
    # Disable "compiling" module into monolithinc PSM1.
    # This modifies the default behavior from the "Build" task
    # in the PowerShellBuild shared psake task module
    $CompileModule = $false
}

task default

task Build -FromModule PowerShellBuild -Version '0.1.0'
