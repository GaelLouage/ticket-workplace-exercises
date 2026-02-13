function Get-ADUserFromGroup{
    param($ou)
    try{
        Get-ADUser -Filter * -SearchBase "OU=$ou,DC=jsslab,DC=local" | Format-Table Name,SamAccountName
    }
    catch {
        Write-Host $_.Exception.Message
    }
    
}


$group = Read-Host("OU")

Get-ADUserFromGroup $group