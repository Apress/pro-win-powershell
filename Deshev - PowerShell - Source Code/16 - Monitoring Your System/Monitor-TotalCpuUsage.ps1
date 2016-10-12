$counter = New-Object Diagnostics.PerformanceCounter
$counter.CategoryName = "Processor"
$counter.CounterName = "% Processor Time"
$counter.InstanceName = "_Total"

while ($true)
{
    $value = $counter.NextValue()
    Write-Host "CPU: $value"
   
    sleep 1
}