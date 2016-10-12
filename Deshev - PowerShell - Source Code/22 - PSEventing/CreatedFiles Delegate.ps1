
Add-PSSnapin PSEventing -ErrorAction SilentlyContinue

$fsw = New-Object System.IO.FileSystemWatcher
$fsw.Path = "c:\powershell"
$fsw.EnableRaisingEvents = $true

$handler = 
{ 
    param($sender, $args)
    $args | format-list
}

$fsw.add_Created($handler)
sleep 10