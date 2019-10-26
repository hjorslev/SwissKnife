---
external help file: SwissKnife-help.xml
Module Name: swissknife
online version:
schema: 2.0.0
---

# Set-RunasDifferentUser

## SYNOPSIS
Activate the option of running an application as a different user in the start menu in Windows 10.

## SYNTAX

```
Set-RunasDifferentUser [-Status] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The run as a different user option is disabled in the start menu in Windows 10.
This script add a registry key allowing the user to run an application as a different user from the start menu.

## EXAMPLES

### EXAMPLE 1
```
Set-RunasDifferentUser
```

## PARAMETERS

### -Status
Choose the status of Run as a different user: activate or deactivate.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Frederik Hjorslev Poulsen

In order for the change to take effect, the computer must be restarted.
You'll be prompted to do this after the registry key has been added.

## RELATED LINKS
