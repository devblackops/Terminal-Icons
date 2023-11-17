function Get-DateTimeFormatString {
    [OutputType([String])]
    param(
        [DateTimeFormat]$Format
    )

    switch ($Format)  {
        ([DateTimeFormat]::ISO8601)            { 'u'; break }
        ([DateTimeFormat]::SORTABLE)           { 's'; break }
        ([DateTimeFormat]::RFC1123)            { 'r'; break }
        ([DateTimeFormat]::GENERAL_SHORT_TIME) { 'g'; break }
        ([DateTimeFormat]::GENERAL_LONG_TIME)  { 'G'; break }
        ([DateTimeFormat]::FULL_SHORT_TIME)    { 'f'; break }
        ([DateTimeFormat]::FULL_LONG_TIME)     { 'F'; break }
        default {''}
    }
}
