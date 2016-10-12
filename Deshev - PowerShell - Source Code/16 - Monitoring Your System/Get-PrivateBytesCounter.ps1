$p = New-Object Diagnostics.PerformanceCounter
$p.CategoryName = "Process"
$p.CounterName = "Private Bytes"
$p.InstanceName = "winword"

while (1)
{
    sleep -milli 1000
    $p.NextValue() / 1024 / 1024
}