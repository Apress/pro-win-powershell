function Start-Debug
{
    Write-Host "Breakpoing hit!" -ForegroundColor Red
    function prompt
    {
        "DEBUG> "
    }
    $host.EnterNestedPrompt()
}

function Count-Characters($file)
{
    $content = ""
    if (Test-Path $file)
    {
        $content = Get-Content $file
    }
    else
    {
        Start-Debug
    }

    Write-Host "File contains $($content.Length) characters" 
}

Count-Characters Print-Debug.ps1
Count-Characters nosuchfile.txt