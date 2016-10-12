Add-PSSnapin PSEventing -ErrorAction SilentlyContinue

$queryString = @'
    SELECT * 
    FROM __InstanceModificationEvent
    WITHIN 10
    WHERE 
        TargetInstance ISA 'Win32_Service'
        AND   TargetInstance.Name = 'w3svc'
        AND   TargetInstance.State = 'Stopped'
'@
        
$query = New-Object System.Management.WQLEventQuery `
    -argumentList $queryString
$watcher = New-Object System.Management.ManagementEventWatcher($query)

Connect-EventListener watcher EventArrived
$watcher.Start()

echo "Waiting for the W3CSVC service to stop..."
Get-Event -wait | `
    foreach { `
        Write-Host -foreground Red "The W3SVC service has stopped!" 
    }

#cleanup
$watcher.Stop()
Disconnect-EventListener watcher EventArrived

echo "done"