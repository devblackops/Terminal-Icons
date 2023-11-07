---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Format-TerminalIcons

## SYNOPSIS
Prepend a custom icon (with color) to the provided file or folder object when displayed.

## SYNTAX

```
Format-TerminalIcons [-FileInfo] <FileSystemInfo> [[-CurrentSettings] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
Take the provided file or folder object and look up the appropriate icon and color to display.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem
```

List a directory.
Terminal-Icons will be invoked automatically for display.

### EXAMPLE 2
```
Get-Item ./README.md | Format-TerminalIcons
```

Get a file object and pass directly to Format-TerminalIcons.

## PARAMETERS

### -FileInfo
The file or folder to display

```yaml
Type: FileSystemInfo
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -CurrentSettings
{{ Fill CurrentSettings Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.IO.FileSystemInfo
### You can pipe an objects that derive from System.IO.FileSystemInfo (System.IO.DIrectoryInfo and System.IO.FileInfo) to 'Format-TerminalIcons'.
## OUTPUTS

### System.String
### Outputs a colorized string with an icon prepended.
## NOTES

## RELATED LINKS
