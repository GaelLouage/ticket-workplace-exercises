function Get-LogErrors {
    param($file)
    if(Test-Path $file){
        Get-Content $file  | Select-String -Pattern "ERROR"
    }
    else
    {
        Write-Host "File not found!"
    }
}

$file = Read-Host ("Filepath")
Get-LogErrors $file