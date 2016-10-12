param ($Path)

$lines = Get-Content -Path $Path
$newLine = [System.Environment]::NewLine

$content = [string]::Join($newLine, $lines)
$content