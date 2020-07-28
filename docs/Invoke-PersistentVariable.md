---
external help file: PersistentVariables-help.xml
Module Name: PersistentVariables
online version: https://github.com/thbiv/PersistentVariables/blob/master/docs/Invoke-PersistentVariable.md
schema: 2.0.0
---

# Invoke-PersistentVariable

## SYNOPSIS
Loads the stored variables from the data file into the current Powerhell session.

## SYNTAX

```
Invoke-PersistentVariable [[-VariableName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Loads the stored variables from the data file into the current Powerhell session.
The variables are loaded underneath a main variable name and are accessed using the following format.

$ParentVariableName.variablename

This function will typically be placed in a Powershell profile so that the variables
are loaded automatically.

## EXAMPLES

### Example 1
```
PS C:\> Invoke-PersistentVariable
```

This example will retrieve the stored variables and load them into the default
parent variable name in the current Powershell session.
The default is 'THBIV-PV'

### Example 2
```
PS C:\> Invoke-PersistentVariable -VariableName 'MyStuff'
```

This example will retrieve the stored variables and load them into variable named 'MyStuff'
in the current Powershell session.

## PARAMETERS

### -VariableName
This will be the parent variable name that will be used to access all stored variables.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: THBIV-PV
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
