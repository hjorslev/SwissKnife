---
external help file: SwissKnife-help.xml
Module Name: swissknife
online version:
schema: 2.0.0
---

# Show-BalloonTip

## SYNOPSIS
Display a Balloon Tip.

## SYNTAX

```
Show-BalloonTip [-Title] <Object> [-Text] <Object> [[-Icon] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Displays a Balloon Tip in the notification center.

## EXAMPLES

### EXAMPLE 1
```
Show-BalloonTip -Title 'New mail' -Text "You've got a new mail from Bill Gates." -Icon Info
```

## PARAMETERS

### -Title
The title of the Balloon Tip.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Text
The text / message in the Balloon Tip.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Icon
The type of balloon tip icon to display.
Valid types are:

None: The balloon tip contain no symbols.

Information: The balloon tip contains a symbol consisting of a lowercase letter i in a circle.

Warning: The balloon tip contains a symbol consisting of an exclamation point in a triangle with a yellow background.

Error: The balloon tip contains a symbol consisting of white X in a circle with a red background.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Info
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Frederik Hjorslev Poulsen

Original script: https://gallery.technet.microsoft.com/scriptcenter/Show-BalloonTip-Show-a-1a932c95

## RELATED LINKS
