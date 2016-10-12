#monitor deleted files

Add-PSSnapin PSEventing -ErrorAction SilentlyContinue

$fsw = New-Object System.IO.FileSystemWatcher
$fsw.Path = "c:\powershell"
$fsw.EnableRaisingEvents = $true

Connect-EventListener fsw deleted

Get-Event -wait | `
    foreach { `
        Write-Host -foreground Yellow `
            "Warning!!! Somebody just deleted $($_.Args.FullPath)" 
    }

Disconnect-EventListener fsw deleted
$fsw.EnableRaisingEvents = $false