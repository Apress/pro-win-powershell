function Start-Process
{
    Write-Host "Starting process..."
    .\UnpredictableCrash.exe
}

for ($i = 0; $i -lt 5; $i++)
{
    Start-Process
    
    Write-Host "Process exited $($i + 1) times."
}

Write-Host "Program restart limit exceeded."