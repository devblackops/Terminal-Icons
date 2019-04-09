---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Format-TerminalIcons

## SYNOPSIS
When displaying in a terminal, prepend a custom icon (with color) to the provided file or folder object.

## SYNTAX

```
Format-TerminalIcons [[-FileInfo] <FileSystemInfo>] [<CommonParameters>]
```

## DESCRIPTION
Take the provided file or folder object and look up the appropriate icon and color to display.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem
```

### EXAMPLE 2
```
Get-Item ./README.md | Format-TerminalIcons
```

## PARAMETERS

### -FileInfo
The file or folder to display

```yaml
Type: FileSystemInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
