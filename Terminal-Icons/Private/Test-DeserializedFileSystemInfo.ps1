function Test-DeserializedFileSystemInfo {
    <#
    .SYNOPSIS
        Tests if an object is a deserialized FileSystemInfo object from PowerShell remoting.
    .DESCRIPTION
        When FileSystemInfo objects (DirectoryInfo/FileInfo) are passed through PowerShell remoting,
        they are deserialized and their type names are prefixed with "Deserialized.".
        This function detects such objects to enable special handling.
    .PARAMETER InputObject
        The object to test for deserialization.
    .OUTPUTS
        System.Boolean
        Returns $true if the object is a deserialized FileSystemInfo object, $false otherwise.
    .EXAMPLE
        Test-DeserializedFileSystemInfo $fileObject
        Returns $true if $fileObject came from a remote session.
    #>
    [OutputType([bool])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [PSObject]$InputObject
    )

    process {
        $typeNames = $InputObject.PSObject.TypeNames
        # -match on an array returns matching items, not a boolean
        # We need to explicitly check and return a boolean
        $matches = $typeNames -match '^Deserialized\.System\.IO\.(DirectoryInfo|FileInfo)$'
        return ($null -ne $matches -and $matches.Count -gt 0)
    }
}
