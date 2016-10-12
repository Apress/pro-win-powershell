trap
{
    continue
}

Write-Host "setting error baseline"
$initialErrorCount = $error.count

$denominator = 0
4/$denominator

del nosuchfile.txt 2> $null

$errorCount = $error.count - $initialErrorCount
Write-Host "Errors since baseline"
for ($i = $errorCount - 1; $i -ge 0; $i--)
{
    $error[$i]
}
