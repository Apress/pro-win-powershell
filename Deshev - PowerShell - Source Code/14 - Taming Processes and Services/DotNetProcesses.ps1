Get-Process | 
foreach { $proc = $_; $proc.Modules | 
	where { $_.ModuleName -eq "mscoree.dll" } | 
	foreach { echo $proc }
}