param ($url, $file, $userName, $password)

$client = New-Object System.Net.WebClient

$credentials = New-Object System.Net.NetworkCredential `
    -arg $userName, $password
$client.Credentials = $credentials

$client.DownloadFile($url, $file)