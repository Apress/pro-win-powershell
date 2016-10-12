param ($Proxy)

$serviceUrl = "http://www.webservicex.net/WeatherForecast.asmx"

$city ="New York"

$soapMessage = @"
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <GetWeatherByPlaceName xmlns="http://www.webservicex.net">
      <PlaceName>$city</PlaceName>
    </GetWeatherByPlaceName>
  </soap:Body>
</soap:Envelope>
"@

$client = New-Object System.Net.WebClient

if ($Proxy)
{
    $proxyConfig = New-Object System.Net.WebProxy -arg $Proxy
    $client.Proxy = $proxyConfig
}

$client.Headers.Add("SOAPAction", `
    "http://www.webservicex.net/GetWeatherByPlaceName")
$client.Headers.Add("Content-Type", "text/xml; charset=utf-8")

$contents = $client.UploadString($serviceUrl, $soapMessage)

$xmlDoc = [xml] $contents

$response = $xmlDoc.Envelope.Body.GetWeatherByPlaceNameResponse
$response.GetWeatherByPlaceNameResult.Details | `
    foreach { 
        $_.WeatherData | select Day,MaxTemperatureC,MaxTemperatureF
    }