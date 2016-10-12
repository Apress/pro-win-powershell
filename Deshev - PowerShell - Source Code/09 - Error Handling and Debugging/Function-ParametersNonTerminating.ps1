function Find-TextFile($name)
{
    if (!(Test-Path $name))
    {
        $errorMessage = "$name does not exist"
        $exception = New-Object System.IO.FileNotFoundException `
            -arg $message,$name
        Write-Error -Exception $exception 
        return $null
    }
    else
    {
        return Get-Item $name
    }
}

Write-Host "Script start"
Find-TextFile "nosuchfile.txt"
Write-Host "Script end"