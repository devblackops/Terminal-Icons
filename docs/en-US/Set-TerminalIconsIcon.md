---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Set-TerminalIconsIcon

## SYNOPSIS
Set a specific icon in the current Terminal-Icons icon theme or allows
swapping one glyph for another.

## SYNTAX

### FileExtension (Default)
```
Set-TerminalIconsIcon -FileExtension <String> -Glyph <String> [-Force] [-ProgressAction <ActionPreference>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Directory
```
Set-TerminalIconsIcon -Directory <String> -Glyph <String> [-Force] [-ProgressAction <ActionPreference>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### FileName
```
Set-TerminalIconsIcon -FileName <String> -Glyph <String> [-Force] [-ProgressAction <ActionPreference>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### SwapGlyph
```
Set-TerminalIconsIcon -NewGlyph <String> -Glyph <String> [-Force] [-ProgressAction <ActionPreference>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Set the Terminal-Icons icon for a specific file/directory or glyph to a
named glyph.

Also allows all uses of a specific glyph to be replaced with a different
glyph.

## EXAMPLES

### EXAMPLE 1
```
Set-TerminalIconsIcon -FileName "README.md" -Glyph "nf-fa-file_text"
```

Set README.md files to display a text file icon.

### EXAMPLE 2
```
Set-TerminalIconsIcon -FileExtension ".xml" -Glyph "nf-md-xml"
```

Set XML files to display an XML file icon.

### EXAMPLE 3
```
Set-TerminalIconsIcon -Directory ".github" -Glyph "nf-dev-github_alt"
```

Set directories named ".github" to display an Octocat face icon.

### EXAMPLE 4
```
Set-TerminalIconsIcon -Glyph "nf-md-xml" -NewGlyph "nf-md-xml"
```

Changes all uses of the "nf-md-xml" double-wide glyph to be the "nf-md-xml"
single-width XML file glyph.

## PARAMETERS

### -Directory
The well-known directory name to match for the icon.

```yaml
Type: String
Parameter Sets: Directory
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileName
The well-known file name to match for the icon.

```yaml
Type: String
Parameter Sets: FileName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileExtension
The file extension to match for the icon.

```yaml
Type: String
Parameter Sets: FileExtension
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NewGlyph
The name of the new glyph to use when swapping.

```yaml
Type: String
Parameter Sets: SwapGlyph
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Glyph
The name of the glyph to use; or, when swapping glyphs, the name of the
glyph you want to change.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
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

### None.
### The command does not accept pipeline input.
## OUTPUTS

### None.
## NOTES

## RELATED LINKS

[Get-TerminalIconsIconTheme]()

[Get-TerminalIconsTheme]()

[Get-TerminalIconsGlyphs]()

