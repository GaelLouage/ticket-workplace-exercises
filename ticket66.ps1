

try{

[string]$logName = Read-Host "Logname"
[int]$maxEvents = Read-Host "Max events"
[string]$levelDisplayName = Read-Host "Leveldisplay"

function Get-Event{
    param(
        [string]$logName,
        [int]$maxEvents
    )

    Get-WinEvent -LogName $Logname -MaxEvents $maxEvents  | Where-Object {$_.LevelDisplayName -eq $levelDisplayName}
}



    Get-Event $Logname $maxEvents
} catch{
    $_.Exception.Message    
}

