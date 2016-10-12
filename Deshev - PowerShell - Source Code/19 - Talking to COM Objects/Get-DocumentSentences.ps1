$wordApp = New-Object -COM Word.Application
$file = (dir SampleReport.docx).FullName

$doc = $wordApp.Documents.Open($file)

$sentences = [object[]] $doc.Sentences
foreach ($sentence in $sentences)
{
    Write-Host "Sentence:"
    Write-Host $sentence.Text
}

$wordApp.Quit()