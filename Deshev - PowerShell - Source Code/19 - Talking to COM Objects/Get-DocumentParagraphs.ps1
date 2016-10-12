$wordApp = New-Object -COM Word.Application
$file = (dir SampleReport.docx).FullName

$doc = $wordApp.Documents.Open($file)

$paragraphs = [object[]] $doc.Paragraphs
foreach ($paragraph in $paragraphs)
{
    Write-Host "PARAGRAPH:"
    Write-Host $paragraph.Range.Text
}

$wordApp.Quit()