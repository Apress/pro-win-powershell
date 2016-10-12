$consoleListener = New-Object Diagnostics.TextWriterTraceListener -arg [Console]::Out

$netSource = New-Object Diagnostics.TraceSource -arg "System.Net"
$netSource.Listeners.Add($consoleListener)

$netMailSource = New-Object Diagnostics.TraceSource -arg "System.Net.Mail"
$netMailSource.Listeners.Add($consoleListener)

$netSwitch = New-Object Diagnostics.TraceSwitch -arg "System.Net", "System.Net log"
$netSwitch.Level = "Verbose"

$netMailSwitch = New-Object Diagnostics.TraceSwitch -arg "System.Net.Mail", "System.Net.Mail log"
$netMailSwitch.Level = "Verbose"

[Diagnostics.Trace]::Listeners.Add($consoleListener)
[Diagnostics.Debug]::Listeners.Add($consoleListener)
[Diagnostics.Trace]::AutoFlush = $true
[Diagnostics.Debug]::AutoFlush = $true