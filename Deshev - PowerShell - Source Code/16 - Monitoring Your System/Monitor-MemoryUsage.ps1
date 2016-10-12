$counter = New-Object Diagnostics.PerformanceCounter
$counter.CategoryName = "Process"
$counter.CounterName = "Private Bytes"
$counter.InstanceName = "memoryhog"

function Get-MemoryUsage()
{
    $value = 0
    trap
    {
        continue
    }
    $value = $counter.NextValue()
    return $value
}

while ($true)
{
    $value = Get-MemoryUsage
    $valueMegaBytes = $value / 1024 / 1024
    Write-Host "Memory: $valueMegaBytes"

    
    if ($valueMegaBytes -gt 30)
    {
        Write-Host "Process exceeded the memory limit. Terminating..."
        Stop-Process -Name memoryhog
        exit
    }
    
    sleep 1
}