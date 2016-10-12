# .\Put-Ftp.ps1 -url ftp://deshev.com/Get-Ftp.ps1
# -file (gi Get-Ftp.ps1).FullName
# -user ftptest -password testpass


param ($url, $file, $userName, $password)

$client = New-Object System.Net.WebClient

$credentials = New-Object System.Net.NetworkCredential `
    -arg $userName, $password
$client.Credentials = $credentials

$client.UploadFile($url, $file)