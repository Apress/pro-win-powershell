trap
{
    Write-Host "Caught $($_.Exception.GetType())"
    continue
}

Write-Host "Script start"
$zero = 0
3 / $zero