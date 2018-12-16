Function Get-PersistentVariable {
    [CmdletBinding()]
    Param(
        [Parameter(Position=0)][string[]]$Name
    )
    $PVDataFile = "$env:LOCALAPPDATA\THBIV\Powershell\PersistentVariables\pv.xml"
    If (Test-Path -Path $PVDataFile) {
        $PV = GetXMLData -Path $PVDataFile
        $Output = @()
        If ($Name) {
            ForEach ($Item in $Name) {
                $Output += ($PV | Where-Object {$_.Name -eq $Item})
            }
        } Else {
            $Output += $PV
        }
        Write-Output $Output
    } Else {
        Write-Warning "Data file not found. Nothing to Output"
    }
}