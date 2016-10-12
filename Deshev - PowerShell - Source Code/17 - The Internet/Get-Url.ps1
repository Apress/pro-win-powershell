param ($Url, $FileName, $Proxy, $Headers = @{},
    $UserName, $Password)

$client = New-Object System.Net.WebClient

if ($Proxy)
{
    $proxyConfig = New-Object System.Net.WebProxy -arg $Proxy
    $client.Proxy = $proxyConfig
}

foreach ($headerName in $Headers.Keys)
{
    $client.Headers.Add($headerName, $Headers[$headerName])
}

if ($UserName -and $Password)
{
    $credentials = New-Object System.Net.NetworkCredential `
        -argumentList $UserName, $Password
    $client.Credentials = $credentials
}

if ($FileName)
{
    $client.DownloadFile($Url, $FileName)
}
else
{
    $contents = $client.DownloadString($Url)
    $contents
}

