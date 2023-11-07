---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Get-TerminalIconsIconTheme

## SYNOPSIS
List the available icon themes.

## SYNTAX

```
Get-TerminalIconsIconTheme [[-CurrentSettings] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
List the available icon themes.

## EXAMPLES

### EXAMPLE 1
```
Get-TerminalIconsIconTheme
```

Get the list of available icon themes.

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

### System.Collections.Hashtable
### An array of hashtables representing available icon themes.
## NOTES

## RELATED LINKS

[Get-TerminalIconsColorTheme]()

[Get-TerminalIconsTheme]()

