$counter = New-Object Diagnostics.PerformanceCounter
$counter.CategoryName = "Process"
$counter.CounterName = "% Processor Time"
$counter.InstanceName = "cpuhog"

function Get-CpuUsage()
{
    $value = 0
    trap
    {
        continue
    }
    $value = $counter.NextValue()
    return $value
}

$abnormalMeasureCount = 0

while ($true)
{
    $value = Get-CpuUsage
    Write-Host "CPU: $value"

    if ($value -gt 80)
    {
        $abnormalMeasureCount++
    }
    else
    {
        $abnormalMeasureCount = 0;
    }
    
    if ($abnormalMeasureCount -gt 10)
    {
        Write-Host "Process appears to be hung. Terminating..."
        Stop-Process -Name cpuhog
        exit
    }
    
    sleep 1
}