Function Add-PersistentVariable {
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory=$True,Position=1,ValueFromPipelineByPropertyName=$True)]
        [string]$Name,

        [Parameter(Mandatory=$True,Position=2,ValueFromPipelineByPropertyName=$True,ParameterSetName='Value')]
        [string]$Value,

        [Parameter(Mandatory=$True,ParameterSetName='EncryptedValue')]
        [switch]$EncryptValue
    )
    Begin{
        $PVDataFile = "$env:LOCALAPPDATA\THBIV\Powershell\PersistentVariables\pv.xml"
        $PV = @()
        If (-not (Test-Path -Path $PVDataFile)) {
            Try {
                InitializeXMLFile -Path $PVDataFile
            }
            Catch {
                $ErrorMessage = $_.Exception.Message
                Write-Warning $ErrorMessage
            }
        }
        $PV += GetXMLData -Path $PVDataFile
    }
    Process{
        $Props = @{}
        If (-not($EncryptValue)) {
            $Props += @{
                'Name' = $Name
                'Value' = $Value
                'IsEncryptedValue' = $False
            }
        } Else {
            $Props += @{
                'Name' = $Name
            }
            $EncryptedValue = Read-Host -Prompt 'Value to Encrypt' -AsSecureString | ConvertFrom-SecureString
            $Props.Add('Value',$EncryptedValue)
            $Props.Add('IsEncryptedValue',$True)
        }
        $Obj = New-Object -TypeName PSObject -Property $Props
        $PV += $Obj
    }
    End {
        If ($PSCmdlet.ShouldProcess("Adding '$Name' to PersistentVariables data file")) {
            Try{
                SaveXMLData -InputObject $PV -Path $PVDataFile
            }
            Catch{
                $ErrorMessage = $_.Exception.Message
                Write-Warning $ErrorMessage
            }
        }
    }
}