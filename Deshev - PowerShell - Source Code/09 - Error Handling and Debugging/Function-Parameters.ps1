trap [System.ArgumentException]
{
    Write-Host "$($_.Exception.Message)"
    continue
}

function Find-TextFile($name = `
    $(throw New-Object System.ArgumentNullException -arg "name"))
{
    if ($name -notlike "*.txt")
    {
        $message = "Find-TextFile: Expecting *.txt files only"
        throw (New-Object System.ArgumentException -arg $message)
    }
    
    return Get-Item $name
}

Find-TextFile "Function-Parameters.ps1"
Find-TextFile