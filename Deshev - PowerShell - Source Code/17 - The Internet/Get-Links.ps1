param ($Url, $BasePage, $BaseServer)

$client = New-Object System.Net.WebClient
$contents = $client.DownloadString($Url)

$pattern = [regex] "<a href=(?<quote>[`"'])(?<url>[^`"']+)\k<quote>"
$matches = $pattern.Matches($contents)

$links = ($matches | foreach { $_.Groups["url"].Value })
$links | foreach {
    if ($_ -like "http://*")
    {
        return $_
    }
    elseif ($_ -like "/*")
    {
        return "$BaseServer$_"
    }
    else
    {
        return "$BasePage$_"
    }
}