function Open-Url($url)
{
    $shell = New-Object -ComObject Shell.Application
    if ($url -notlike "http://*")
    {
        $url = "http://" + $url
    }
    $shell.Open($url)
}

function Encode-Url($inputString)
{
    $null = [Reflection.Assembly]::LoadWithPartialName("System.Web")
    return [Web.HttpUtility]::UrlEncode($inputString)
}
function Search-Msdn($query)
{
    $encodedQuery = Encode-Url $query
    Open-Url ("http://search.msdn.microsoft.com/search/" + `
            "Default.aspx?query=$encodedQuery")
}

function Show-MsdnHelp($object)
{
    $typeName = $object.GetType().FullName
    Open-Url "http://msdn2.microsoft.com/en-us/library/$typeName.aspx"
}

function Search-Google($query)
{
    $encodedQuery = Encode-Url $query
    Open-Url "http://www.google.com/search?q=$encodedQuery"
}

function Search-LiveCom($query)
{
    $encodedQuery = Encode-Url $query
    Open-Url "http://search.live.com/results.aspx?q=$encodedQuery"
}
