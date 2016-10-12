$query = "SELECT * from Win32_Process WHERE Name = 'winword.exe'"
Get-WmiObject -query $query | select ProcessId