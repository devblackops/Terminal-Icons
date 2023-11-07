---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Show-TerminalIconsTheme

## SYNOPSIS
List example directories and files to show the currently applied color and icon themes.

## SYNTAX

```
Show-TerminalIconsTheme [[-CurrentSettings] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
List example directories and files to show the currently applied color and icon themes.
The directory/file objects show are in memory only, they are not written to the filesystem.

## EXAMPLES

### EXAMPLE 1
```
Show-TerminalIconsTheme
```

List example directories and files to show the currently applied color and icon themes.

## PARAMETERS

### -CurrentSettings
{{ Fill CurrentSettings Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $script:current
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None.
## OUTPUTS

### System.IO.DirectoryInfo
### System.IO.FileInfo
## NOTES
Example directory and file objects only exist in memory.
They are not written to the filesystem.

## RELATED LINKS

[Get-TerminalIconsColorTheme]()

[Get-TerminalIconsIconTheme]()

[Get-TerminalIconsTheme]()

