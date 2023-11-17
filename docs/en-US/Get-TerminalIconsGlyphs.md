---
external help file: Terminal-Icons-help.xml
Module Name: Terminal-Icons
online version:
schema: 2.0.0
---

# Get-TerminalIconsGlyphs

## SYNOPSIS
Gets the list of glyphs known to Terminal-Icons.

## SYNTAX

```
Get-TerminalIconsGlyphs [[-Glyphs] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
Gets a hashtable with the available glyph names and icons.
Useful in creating a custom theme.

## EXAMPLES

### EXAMPLE 1
```
Get-TerminalIconsGlyphs
```

Gets the table of glyph names and icons.

## PARAMETERS

### -Glyphs
{{ Fill Glyphs Description }}

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $script:glyphs
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None.
## OUTPUTS

### None.
## NOTES

## RELATED LINKS

[Get-TerminalIconsIconTheme]()

[Set-TerminalIconsIcon]()

