---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Set-TerminalIconsPreference

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

```
Set-TerminalIconsPreference [[-IconTheme] <String>] [[-ColorTheme] <String>]
 [[-DateTimeFormat] <DateTimeFormat>] [[-TimeZoneDisplay] <TimeZoneDisplay>] [[-RendorMode] <RendorMode>]
 [[-FileSizeDisplay] <FileSizeDisplay>] [[-Preferences] <Preferences>] [[-CurrentSettings] <Hashtable>]
 [-PassThru] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -IconTheme
{{ Fill IconTheme Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorTheme
{{ Fill ColorTheme Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DateTimeFormat
{{ Fill DateTimeFormat Description }}

```yaml
Type: DateTimeFormat
Parameter Sets: (All)
Aliases:
Accepted values: ISO8601, HUMANIZE, SORTABLE, RFC1123, GENERAL_SHORT_TIME, GENERAL_LONG_TIME, FULL_SHORT_TIME, FULL_LONG_TIME

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TimeZoneDisplay
{{ Fill TimeZoneDisplay Description }}

```yaml
Type: TimeZoneDisplay
Parameter Sets: (All)
Aliases:
Accepted values: Local, UTC

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RendorMode
{{ Fill RendorMode Description }}

```yaml
Type: RendorMode
Parameter Sets: (All)
Aliases:
Accepted values: Normal, Bold, Italic, Underline

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileSizeDisplay
{{ Fill FileSizeDisplay Description }}

```yaml
Type: FileSizeDisplay
Parameter Sets: (All)
Aliases:
Accepted values: Bytes, KB_MB_GB

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Preferences
{{ Fill Preferences Description }}

```yaml
Type: Preferences
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: $script:prefs
Accept pipeline input: False
Accept wildcard characters: False
```

### -CurrentSettings
{{ Fill CurrentSettings Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: $script:Current
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
{{ Fill PassThru Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
