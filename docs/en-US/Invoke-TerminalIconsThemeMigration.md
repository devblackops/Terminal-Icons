---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Invoke-TerminalIconsThemeMigration

## SYNOPSIS
Used to migrate your terminal icon themes to Nerd Fonts v3.

## SYNTAX

### Path
```
Invoke-TerminalIconsThemeMigration [-Path] <String[]> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### LiteralPath
```
Invoke-TerminalIconsThemeMigration [-LiteralPath] <String[]> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Used to migrate your terminal icon themes to Nerd Fonts v3.

## EXAMPLES

### EXAMPLE 1
```
Invoke-TerminalIconsThemeMigration -Path ./my_icon_theme.psd1 | Out-File ./migrated_icon_theme.psd1
```

Loads the theme, migrates classes and then saves the newly migrated theme using the Out-File command.

## PARAMETERS

### -Path
{{ Fill Path Description }}

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
{{ Fill LiteralPath Description }}

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

### None.
## OUTPUTS

### System.String
### The theme that has been fully migrated.
## NOTES

## RELATED LINKS

[Invoke-TerminalIconsThemeMigration]()

[Invoke-TerminalIconsThemeMigration]()

