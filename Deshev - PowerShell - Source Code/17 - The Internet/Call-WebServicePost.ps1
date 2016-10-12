param ($Proxy)

$serviceUrl = "http://www.webservicex.net/WeatherForecast.asmx"
$url = "$serviceUrl/GetWeatherByPlaceName"

$values = New-Object Collections.Specialized.NameValueCollection
$values["PlaceName"] = "New York"

$client = New-Object System.Net.WebClient

if ($Proxy)
{
    $proxyConfig = New-Object System.Net.WebProxy -arg $Proxy
    $client.Proxy = $proxyConfig
}

$rawData = $client.UploadValues($url, $values)

$contents = [Text.Encoding]::UTF8.GetString($rawData)
$xmlDoc = [xml] $contents
$xmlDoc.WeatherForecasts.Details | `
    foreach { 
        $_.WeatherData | select Day,MaxTemperatureC,MaxTemperatureF
    }