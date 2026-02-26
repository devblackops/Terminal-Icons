---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Add-TerminalIconsColorTheme

## SYNOPSIS
Add a Terminal-Icons color theme for the current user.

## SYNTAX

### Path (Default)
```
Add-TerminalIconsColorTheme [-Path] <String[]> [-Force] [-ProgressAction <ActionPreference>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### LiteralPath
```
Add-TerminalIconsColorTheme [-LiteralPath] <String[]> [-Force] [-ProgressAction <ActionPreference>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Add a Terminal-Icons color theme for the current user.
The theme data
is stored in the user's profile

## EXAMPLES

### EXAMPLE 1
```
Add-Terminal-IconsColorTHeme -Path ./my_color_theme.psd1
```

Add the color theme contained in ./my_color_theme.psd1.

### EXAMPLE 2
```
Get-ChildItem ./path/to/colorthemes | Add-TerminalIconsColorTheme -Force
```

Add all color themes contained in the folder ./path/to/colorthemes and add them,
overwriting existing ones if needed.

## PARAMETERS

### -Path
The path to the Terminal-Icons color theme file.

```yaml
Type: String[]
Parameter Sets: Path
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: True
```

### -LiteralPath
The literal path to the Terminal-Icons color theme file.

```yaml
Type: String[]
Parameter Sets: LiteralPath
Aliases: PSPath

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Force
Overwrite the color theme if it already exists in the profile.

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
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

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

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

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
### You can pipe a string that contains a path to 'Add-TerminalIconsColorTheme'.
## OUTPUTS

### None.
## NOTES
'Add-TerminalIconsColorTheme' will not overwrite an existing theme by default.
Add the -Force switch to overwrite.

## RELATED LINKS

[Add-TerminalIconsIconTheme]()

