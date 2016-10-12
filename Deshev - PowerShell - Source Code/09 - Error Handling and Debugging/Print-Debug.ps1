function Instrument-Function($body)
{
    $parentInvocation = Get-Variable MyInvocation -scope 1 -ValueOnly
    $functionName = $parentInvocation.MyCommand.Name
    
    trap
    {
        Write-Debug "$functionName raised an error"
    }
    
    Write-Verbose "Entering $functionName"
    &$body
    Write-Verbose "Leaving $functionName"
}

function Count-Characters($file)
{
    Instrument-Function {
        Write-Host "Opening $file" `
            -Background White -Foreground DarkGreen
        $content = ""
        if (Test-Path $file)
        {
            $content = Get-Content $file
        }
        else
        {
            Write-Warning "$file does not exist."
        }

        Write-Host "File contains $($content.Length) characters" `
            -Background White -Foreground DarkGreen
    }
}

Count-Characters Print-Debug.ps1
Count-Characters nosuchfile.txt