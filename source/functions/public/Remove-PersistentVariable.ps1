Function Remove-PersistentVariable {
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory=$True,Position=1)]
        [string]$Name
    )
    $PVDataFile = "$env:LOCALAPPDATA\THBIV\Powershell\PersistentVariables\pv.xml"
    If (Test-Path -Path $PVDataFile) {
        $PV = GetXMLData -Path $PVDataFile
        $Output = @()
        $Output += ($PV | Where-Object {$_.Name -ne $Item})
        If ($PSBoundParameters.Name) {
            ForEach ($Item in $Name) {
                $Output += ($PV | Where-Object {$_.Name -ne $Item})
            }
        }
        If ($PSCmdlet.ShouldProcess("Deleting '$Name' from PersistentVariables data file")) {
            SaveXMLData -InputObject $Output -Path $PVDataFile
        }
    } Else {
        Write-Warning "Data File not found. Nothing to remove. Please use Add-PersistentVariable to create the data file."
    }
}