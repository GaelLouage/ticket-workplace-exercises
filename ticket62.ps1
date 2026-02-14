function Get-StoppedServiceByName{
    param($service)
    Get-Service | Where-Object {$_.Status -eq "Stopped" -and $_.Name -eq $service}
}

$service = Read-Host("Service Name")
Get-StoppedServiceByName $service



