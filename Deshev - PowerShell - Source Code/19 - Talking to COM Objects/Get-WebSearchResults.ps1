function WaitForLoad ($ie)
{
    while ($ie.Busy)
    {
        sleep -milliseconds 50
    }
}

$ie = New-Object -COM InternetExplorer.Application
$ie.Navigate("http://www.live.com")
WaitForLoad($ie)

$searchBox = $ie.Document.getElementById("q")
$searchBox.value = "`"Pro Windows PowerShell`""
$goButton = $ie.Document.getElementById("go")
$goButton.click();

WaitForLoad($ie)

$resultsDiv = $ie.Document.getElementById("results")
$links = [object[]] $resultsDiv.getElementsByTagName("a")
$realLinks = $links | where { $_.innerText -ne "Cached page" }
$realLinks | select innerText,href | Format-List

$ie.Quit()