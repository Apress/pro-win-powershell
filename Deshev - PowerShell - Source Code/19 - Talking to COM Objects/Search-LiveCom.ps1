function WaitForLoad ($ie)
{
    while ($ie.Busy)
    {
        sleep -milliseconds 50
    }
}

$ie = New-Object -COM InternetExplorer.Application
$ie.Navigate("http://www.live.com")
$ie.Visible = $true
WaitForLoad($ie)

$searchBox = $ie.Document.getElementById("q")
$searchBox.value = "`"Pro Windows PowerShell`""
$goButton = $ie.Document.getElementById("go")
$goButton.click();