Add-PSSnapin PSEventing -ErrorAction SilentlyContinue

$securityLog = New-Object System.Diagnostics.EventLog "Security"
$securityLog.EnableRaisingEvents = $true

Connect-EventListener securityLog EntryWritten
$logonAttemptEventInstanceID = 4648

Get-Event -wait | `
    where { `
        $_.Args.Entry.InstanceID -eq $logonAttemptEventInstanceID 
    } | `
    foreach { `
        Write-Host -foreground Red `
            "Logon attempt at: $($_.Args.Entry.TimeGenerated)" 
    }

Disconnect-EventListener securityLog EntryWritten
$securityLog.EnableRaisingEvents = $false