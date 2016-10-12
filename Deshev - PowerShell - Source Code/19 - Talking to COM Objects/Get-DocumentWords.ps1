$wordApp = New-Object -COM Word.Application
$file = (dir SampleReport.docx).FullName

$doc = $wordApp.Documents.Open($file)

$words = [object[]] $doc.Words
$words | select Text

$wordApp.Quit()