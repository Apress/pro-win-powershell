param ($url)

trap
{
    Write-Host $_
    #clean up the current request
    $request.Abort()
    #an error occurred. ignore it and continue to returning false.
    continue
}

$request = [System.Net.WebRequest]::Create($url)
$request.Method = "HEAD"
$request.TimeOut = 5000
if ($request.GetResponse().StatusCode -eq "OK")
{
    #clean up the current request
    $request.GetResponse().Close()
    return $true
}

#should get here only if we got an error for our web request
return $false