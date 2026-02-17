try {
    $user = Read-Host("Enable user")

    function Get-EnableUser(){
        param([string]$user)
            $userToEnable = Get-ADUser -Server DCLAB01 -Filter * | Where-Object {$_.Enabled -eq $false -and $_.SamAccountName -eq "Gael Louage"}
            Enable-ADAccount $user

    }

    Get-EnableUser $user
    Get-ADUser -Server DCLAB01 -Filter * | Where-Object {$_.SamAccountName -eq "GaelL"}
} 
catch {

    $_.Exception.Message
    
}
