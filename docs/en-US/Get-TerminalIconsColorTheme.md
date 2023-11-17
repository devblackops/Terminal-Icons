---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Get-TerminalIconsColorTheme

## SYNOPSIS
List the available color themes.

## SYNTAX

```
Get-TerminalIconsColorTheme [[-CurrentSettings] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
List the available color themes.

## EXAMPLES

### EXAMPLE 1
```
Get-TerminalIconsColorTheme
```

Get the list of available color themes.

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
### An array of hashtables representing available color themes.
## NOTES

## RELATED LINKS

[Get-TerminalIconsIconTheme]()

[Get-TerminalIconsTheme]()

