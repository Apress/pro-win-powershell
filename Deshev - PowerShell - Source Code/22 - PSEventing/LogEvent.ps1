#monitor deleted files

$appLog = New-Object System.Diagnostics.EventLog -argumentList "Application",".","MsiInstaller"
$appLog.WriteEntry("testing... 1, 2, 3...", 4, 1035)