---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Get-TerminalIconsTheme

## SYNOPSIS
Get the currently applied color and icon theme.

## SYNTAX

```
Get-TerminalIconsTheme [[-CurrentSettings] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
Get the currently applied color and icon theme.

## EXAMPLES

### EXAMPLE 1
```
Get-TerminalIconsTheme
```

Get the currently applied Terminal-Icons color and icon theme.

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

### System.Management.Automation.PSCustomObject
### An object representing the currently applied color and icon theme.
## NOTES

## RELATED LINKS

[Get-TerminalIconsColorTheme]()

[Get-TerminalIconsIconTheme]()

