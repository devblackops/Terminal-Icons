function Import-XmlThemes {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    param()

    $script:iconThemes     = Import-Clixml -Path $script:moduleRoot/Data/iconThemes.xml
    $script:colorThemes    = Import-Clixml -Path $script:moduleRoot/Data/colorThemes.xml
    $script:colorSequences = Import-Clixml -Path $script:moduleRoot/Data/colorSequences.xml
    $script:glyphs         = Import-Clixml -Path $script:moduleRoot/Data/glyphs.xml
    $script:current.Themes = @{
        Color = $script:colorThemes
        Icon  = $script:iconThemes
    }
}
