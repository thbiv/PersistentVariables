Function Remove-PersistentVariable {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True,Position=1)]
        [string[]]$Name
    )
    
    $PVDataFile = "$env:LOCALAPPDATA\THBIV\Powershell\PersistentVariables\pv.xml"
    If (Test-Path -Path $PVDataFile) {
        $PV = GetXMLData -Path $PVDataFile
        $Output = @()
        If ($PSBoundParameters.Name) {
            ForEach ($Item in $Name) {
                $Output += ($PV | Where-Object {$_.Name -ne $Item})
            }
        }
        SaveXMLData -InputObject $Output -Path $PVDataFile
    } Else {
        Write-Warning "Data File not found. Nothing to remove. Please use Add-PersistentVariable to create the data file."
    }
}