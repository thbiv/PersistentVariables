---
external help file: PersistentVariables-help.xml
Module Name: PersistentVariables
online version: https://github.com/thbiv/PersistentVariables/blob/master/docs/Add-PersistentVariable.md
schema: 2.0.0
---

# Add-PersistentVariable

## SYNOPSIS
Adds a variable name/value pair to the data file.

## SYNTAX

### Value
```
Add-PersistentVariable [-Name] <String> [-Value] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### EncryptedValue
```
Add-PersistentVariable [-Name] <String> [-EncryptValue] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Adds a variable name/value pair to the data file.
It is also possible to encrypt the value for when it is stored in the data file.

## EXAMPLES

### Example 1
```
PS C:\> Add-PersistentVariable -Name 'PhoneNumber' -Value '867-6309'
```

This example add a variable named 'PhoneNumber' to the data file that has a value of '867-5309'

### Example 2
```
PS C:\> Add-PersistentVariable -Name 'PhoneNumber' -EncryptValue
```

This example will create a name/value pair with the value encrypted for storing in the data file.
Instead of entering the value with a parameter, the function will prompt for the value.

## PARAMETERS

### -EncryptValue
Tells the function to encrypt the value for storing in the data file.
This parameter cannot be used with '-Value'.

```yaml
Type: SwitchParameter
Parameter Sets: EncryptedValue
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the variable to be stored.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Value
The value of the variable to be stored. This value is stored in plain text.
This parameter cannot be used with '-EncryptValue'.

```yaml
Type: String
Parameter Sets: Value
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
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

### System.String
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
