function Import-CliXmlWithRetry {
    [cmdletbinding()]
    param(
        [parameter(Mandatory)]
        [string]$Path,

        [int]$RetryCount = 5
    )

    # Another session may briefly hold the file open while saving it
    for ($i = 1; $i -le $RetryCount; $i++) {
        try {
            return Import-CliXml -Path $Path -ErrorAction Stop
        } catch [IO.IOException] {
            if ($i -eq $RetryCount) { throw }
            Start-Sleep -Milliseconds (50 * $i)
        }
    }
}
