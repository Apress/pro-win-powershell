#monitor deleted files

Add-PSSnapin PSEventing -ErrorAction SilentlyContinue
#include the PSEventing utility function definitions
. "C:\Program Files\Windows PowerShell Eventing\eventhandler.ps1"

$fsw = New-Object System.IO.FileSystemWatcher
$fsw.Path = "c:\powershell"
$fsw.EnableRaisingEvents = $true

$fswVariable = (Get-Variable fsw)
$deletedBlock = { 
    param ($sender, $args)
    out-host -input "file deleted"
    format-list -property ChangeType,FullPath -input $args
}
$createdBlock = { 
    param ($sender, $args)
    out-host -input "file created"
    format-list -property ChangeType,FullPath -input $args
}

Add-EventHandler $fswVariable Deleted $deletedBlock
Add-EventHandler $fswVariable Created $createdBlock

Do-Events $true

Remove-EventHandler $fswVariable Deleted
Remove-EventHandler $fswVariable Created
$fsw.EnableRaisingEvents = $false