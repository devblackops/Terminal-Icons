function Get-RendorModeUnicode {
    [OutputType([String])]
    param(
        [RendorMode]$RendorMode
    )

    switch ($RendorMode) {
        ([RendorMode]::Normal)    { $null; break }
        ([RendorMode]::Bold)      { $script:bold; break}
        ([RendorMode]::Italic)    { $script:italic; break }
        ([RendorMode]::Underline) { $script:underline; break }
        default { $null}
    }
}
