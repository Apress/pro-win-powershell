Write-Host "script begin"

[int] "not a number"
$denominator = 0
$result = 50 / $denominator

Write-Host "script end"

trap [System.Management.Automation.PSInvalidCastException]
{
    Write-Host "Error converting a string to a number!"
    continue
}

trap [System.DivideByZeroException]
{
    Write-Host "Attempted to divide by zero!"
    continue
}