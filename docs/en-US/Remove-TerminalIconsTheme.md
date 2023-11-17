---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Remove-TerminalIconsTheme

## SYNOPSIS
Removes a color or icon theme

## SYNTAX

```
Remove-TerminalIconsTheme [[-IconTheme] <String>] [[-ColorTheme] <String>] [[-CurrentSettings] <Hashtable>]
 [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Removes a given icon or color theme.
In order to be removed, a theme must not be active.

## EXAMPLES

### EXAMPLE 1
```
Remove-TerminalIconsTheme -IconTheme MyAwesomeTheme
```

Removes the icon theme 'MyAwesomeTheme'

### EXAMPLE 2
```
Remove-TerminalIconsTheme -ColorTheme MyAwesomeTheme
```

Removes the color theme 'MyAwesomeTheme'

## PARAMETERS

### -IconTheme
The icon theme to remove.

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
The color theme to remove.

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

### -CurrentSettings
{{ Fill CurrentSettings Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: $script:current
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Bypass confirmation messages.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String
### The name of the color or icon theme to remove.
## OUTPUTS

### None.
## NOTES
A theme must not be active in order to be removed.

## RELATED LINKS

[Set-TerminalIconsTheme]()

[Add-TerminalIconsColorTheme]()

[Add-TerminalIconsIconTheme]()

[Get-TerminalIconsTheme]()

