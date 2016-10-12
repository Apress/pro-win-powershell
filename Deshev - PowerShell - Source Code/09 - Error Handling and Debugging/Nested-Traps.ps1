trap
{
    $error = $_.Exception.GetType()
    Write-Host "Caught $error outside function"
    continue
}

function Generate-DivideByZero
{
    trap
    {
        $error = $_.Exception.GetType()
        Write-Host "Caught $error inside function"
        break
    }
    
    $denominator = 0
    $result = 50 / $denominator
}

Write-Host "script begin"

Generate-DivideByZero
[int] "not a number"

Write-Host "script end"