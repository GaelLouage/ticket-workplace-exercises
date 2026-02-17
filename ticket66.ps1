try {
    $sam = Read-Host "Geef SamAccountName van de gebruiker"

    $user = Get-ADUser -Server DCLAB01 -Filter "SamAccountName -eq '$sam' -and Enabled -eq 'False'" -ErrorAction Stop

    Enable-ADAccount -Identity $user -ErrorAction Stop

    Write-Host "Gebruiker $($user.SamAccountName) is geactiveerd"

}
catch {
    Write-Error $_.Exception.Message
}