param ($Path)

$start = Get-Content -Path $Path -Encoding Byte -TotalCount 3

$utf8BOM = "{0:X}{1:X}{2:X}" -f $start
$utf16BOM = "{0:X}{1:X}" -f $start

if ($utf8BOM -eq "EFBBBF")
{
    Write-Host "UTF-8"
    exit
}

if ($utf16BOM -eq "FFFE")
{
    Write-Host "Unicode"
    exit
}

if ($utf16BOM -eq "FEFF")
{
    Write-Host "Big Endian Unicode"
    exit
}

Write-Host "No BOM detected. Encoding is most likely ASCII."