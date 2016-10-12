param ($Name = "*", $Query = { $true })

$topics = Get-Help $Name

foreach ($topic in $topics)
{
    $matchingExamples = $topic.examples.example | where $Query
    if ($matchingExamples)
    {
        #output the found examples
        $matchingExamples
    }
}


#.\Search-Examples.ps1 -Name *content* -Query { $_.remarks -like "*notice.txt*" }
#.\Search-Examples.ps1 -Name *content* -Query { $_.code -like "*foreach*" }