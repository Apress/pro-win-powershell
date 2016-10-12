#monitor deleted files

Add-PSSnapin PSEventing -ErrorAction SilentlyContinue

$fsw = New-Object System.IO.FileSystemWatcher
$fsw.Path = "c:\powershell"
$fsw.EnableRaisingEvents = $true

Start-KeyHandler -CaptureCtrlC
Connect-EventListener fsw deleted

do
{
    $events = Get-Event -wait
}
while(!$events)

foreach ($event in $events)
{
    if ($event.Name -eq "CtrlC")
    {
        Write-Host "Ctrl+C detected"
        break;
    }
    else
    {
        Write-Host -foreground Yellow ` 
            "Warning!!! Somebody just deleted $($event.Args.FullPath)"
    }
}

Stop-KeyHandler
Disconnect-EventListener fsw deleted
$fsw.EnableRaisingEvents = $false
