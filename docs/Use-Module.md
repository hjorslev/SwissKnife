---
external help file: SwissKnife-help.xml
Module Name: swissknife
online version:
schema: 2.0.0
---

# Use-Module

## SYNOPSIS
Load a module.

## SYNTAX

```
Use-Module [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Loads a module.
Depending on whether the console is elevated or not the module
 will be installed globally on the machine or locally in the user's folder.

## EXAMPLES

### EXAMPLE 1
```
Use-Module -Name Logging
```

## PARAMETERS

### -Name
Specify the name of the module.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Frederik Hjorslev Poulsen

## RELATED LINKS
