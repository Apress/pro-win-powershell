param ($Proxy)

$serviceUrl = "http://www.webservicex.net/WeatherForecast.asmx"
$city = "New York"
$url = "$serviceUrl/GetWeatherByPlaceName?PlaceName=$city"

$client = New-Object System.Net.WebClient

if ($Proxy)
{
    $proxyConfig = New-Object System.Net.WebProxy -arg $Proxy
    $client.Proxy = $proxyConfig
}

$contents = $client.DownloadString($url)
$xmlDoc = [xml] $contents
$xmlDoc.WeatherForecasts.Details | `
    foreach { 
        $_.WeatherData | select Day,MaxTemperatureC,MaxTemperatureF
    }