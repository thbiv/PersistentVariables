---
external help file: PersistentVariables-help.xml
Module Name: PersistentVariables
online version: https://github.com/thbiv/PersistentVariables/blob/master/docs/Get-PersistentVariable.md
schema: 2.0.0
---

# Get-PersistentVariable

## SYNOPSIS
Returns variables that are stored in the PersistentVariable data file.

## SYNTAX

```
Get-PersistentVariable [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns variables that are stored in the PersistentVariable data file.
If the values are encrypted, the function will not output the long encrypted string.
Instead, it will use a place holder of '{EncryptedValue}'.

## EXAMPLES

### Example 1
```
PS C:\> Get-PersistentVariable
```

This example will return all variables from the data file.

### Example 1
```
PS C:\> Get-PersistentVariable -Name 'PhoneNumber'
```

This example will return a variable the is named 'PhoneNumber'.

## PARAMETERS

### -Name
The name of the variable to return.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
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
