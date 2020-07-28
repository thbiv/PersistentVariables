---
external help file: PersistentVariables-help.xml
Module Name: PersistentVariables
online version: https://github.com/thbiv/PersistentVariables/blob/master/docs/Remove-PersistentVariable.md
schema: 2.0.0
---

# Remove-PersistentVariable

## SYNOPSIS
Deletes a variable name/value pair from the PersistentVariable data file.

## SYNTAX

```
Remove-PersistentVariable [-Name] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Deletes a variable name/value pair from the PersistentVariable data file.

## EXAMPLES

### Example 1
```
PS C:\> Remove-PersistentVariable -Name 'PhoneNumber'
```

This example will delete a variable named 'PhoneNumber' from the data file.

## PARAMETERS

### -Name
The name of the variable to be removed.

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

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

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
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
