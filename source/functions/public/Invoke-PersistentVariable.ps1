Function Invoke-PersistentVariable {
    [CmdletBinding()]
    Param()
    $PV = GetXMLData -Path $PVDataFile
    $Output = New-Object -TypeName PSObject
    ForEach ($Item in $PV) {
        $Output | Add-Member -NotePropertyName $($Item.Name) -NotePropertyValue $($Item.Value)
    }
    $Output.PSObject.TypeNames.Insert(0,'THBIV.PersistantVariables')
    New-Variable -Name THBIV_PV -Value $Output -Scope Global -Option Constant -Description 'Persistant Variables'
}