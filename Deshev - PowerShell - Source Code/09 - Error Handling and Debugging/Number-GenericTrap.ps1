trap
{
    $exceptionType = $_.Exception.GetType()
    $innerExceptionType = "No inner exception"
    if ($_.Exception.InnerException)
    {    
        $innerExceptionType = $_.Exception.InnerException.GetType()
    }

    Write-Host "FullyQualifiedErrorId: $($_.FullyQualifiedErrorId)"
    Write-Host "Exception: $exceptionType"
    Write-Host "InnerException: $innerExceptionType"
    
    continue
}

Write-Host "script begin"

[int] "not a number"
$denominator = 0
$result = 50 / $denominator

Write-Host "script end"