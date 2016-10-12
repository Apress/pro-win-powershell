trap [System.Management.Automation.PSInvalidCastException]
{
    Write-Host "Error converting a string to date!"
    $realException = $_.Exception.InnerException
    Write-Host "Inner Exception: $($realException.GetType())"
    break
}

Write-Host "script begin"

$dateStrings = "10/15/2007", "bad/date/format", "10/20/2007"
foreach ($dateString in $dateStrings)
{
    $date = [datetime] $dateString
    Write-Host $date
}

Write-Host "script end"