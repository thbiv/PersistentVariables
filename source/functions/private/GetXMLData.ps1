Function GetXMLData {
    Param(
        [string]$Path
    )
    If (-not (Test-Path -Path $Path)) {
        Try {
            InitializeXMLFile -Path $PVDataFile
        }
        Catch{
            $ErrorMessage = $_.Exception.Message
            Throw $ErrorMessage
        }
    }
    $XML = New-Object -TypeName XML
    $XML.Load($Path)
    $XMLPV = $XML.persistentvariables.variables.item
    $Output = @()
    ForEach ($Item in $XMLPV) {
        $Props = @{
            'Name' = $Item.name
            'Value' = $Item.value
            'IsEncryptedValue' = $Item.isencryptedvalue
        }
        $Obj = New-Object -TypeName PSObject -Property $Props
        $Output += $Obj
    }
    Write-Output $Output
}