Function Invoke-PersistentVariable {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$False)]
        [string]$VariableName = 'THBIV-PV'
    )

    If ($(Get-Variable -Name $VariableName)) {
        Write-Warning -Message " The variable '$VariableName' already exists. Please choose another variable name."
    } Else {
        $PV = @()
        $PVDataFile = "$env:LOCALAPPDATA\THBIV\Powershell\PersistentVariables\pv.xml"
        $PV += GetXMLData -Path $PVDataFile
        $Output = New-Object -TypeName PSObject
        ForEach ($Item in $PV) {
            If ($Item.IsEncryptedValue -eq $True) {
                $sString = $($Item.Value | ConvertTo-SecureString)
                $vValue = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR((($sString))))
            } Else {
                $vValue = $($Item.Value)
            }
            $Output | Add-Member -NotePropertyName $($Item.Name) -NotePropertyValue $vValue
        }
        $Output.PSObject.TypeNames.Insert(0,'THBIV.PersistantVariables')
        New-Variable -Name $VariableName -Value $Output -Scope Global -Option Constant -Description 'Persistent Variables'
    }
}