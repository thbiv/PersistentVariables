Function Add-PersistentVariable {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True,Position=1,ValueFromPipelineByPropertyName=$True)]
        [string]$Name,

        [Parameter(Mandatory=$True,Position=2,ValueFromPipelineByPropertyName=$True)]
        [string]$Value
    )
    Begin{
        $PVDataFile = "$env:LOCALAPPDATA\THBIV\Powershell\PersistentVariables\pv.xml"
        If (-not (Test-Path -Path $PVDataFile)) {
            Try {
                InitializeXMLFile -Path $PVDataFile
            }
            Catch {
                $ErrorMessage = $_.Exception.Message
                Write-Warning $ErrorMessage
            }
        }
        $PV = GetXMLData -Path $PVDataFile
    }
    Process{
        $Props = @{
            'Name' = $Name;
            'Value' = $Value;
        }
        $Obj = New-Object -TypeName PSObject -Property $Props
        $PV += $Obj
    }
    End{
        Try{
            SaveXMLData -InputObject $PV -Path $PVDataFile
        }
        Catch{
            $ErrorMessage = $_.Exception.Message
            Write-Warning $ErrorMessage
        }
    }
}