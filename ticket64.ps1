[int]$readInt = Read-Host "Find volume with MB more than"
$SizeThreshold = $readInt * 1024 * 1024

function Get-volumesWithRemainingSize{
    param([int64]$SizeRemaining)
    
    $volumes = Get-Volume | Where-Object {$_.SizeRemaining -gt $SizeRemaining} 
    
     foreach ($volume in $volumes) {
        Write-Host "Volume:" $volume.FileSystemType

        $convertToMB = [Math]::Round($volume.SizeRemaining / 1024 / 1024, 2)

        if ($convertToMB -ge 1024) {
            $convertToGB = [Math]::Round($convertToMB / 1024, 2)
            Write-Host "Free Space:" $convertToGB "GB"
        } else {
            Write-Host "Free Space:" $convertToMB "MB"
        }

        Write-Host "----------------------"
    }
}


Get-volumesWithRemainingSize -SizeRemaining  $SizeThreshold 




