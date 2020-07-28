Function Get-PersistentVariable {
    [CmdletBinding()]
    Param(
        [Parameter(Position=0)][string]$Name
    )
    $PVDataFile = "$env:LOCALAPPDATA\THBIV\Powershell\PersistentVariables\pv.xml"
    $PV = @()
    If (Test-Path -Path $PVDataFile) {
        $PV += GetXMLData -Path $PVDataFile
        $Filtered = @()
        If ($Name) {
            $Filtered += ($PV | Where-Object {$_.Name -eq $Name})
        } Else {
            $Filtered += $PV
        }
        ForEach ($Item in $Filtered) {
            If ($Item.IsEncryptedValue -eq $True) {
                $vValue = '{EncryptedValue}'
            } Else {
                $vValue = $($Item.value)
            }
            $Props = [ordered]@{
                'Name' = $($Item.name)
                'Value' = $vValue
                'IsEncryptedValue' = $($Item.isencryptedvalue)
            }
            Write-Output $(New-Object -TypeName PSObject -Property $Props)
        }
    } Else {
        Write-Verbose "Data file not found. Nothing to Output"
    }
}