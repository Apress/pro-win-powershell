$wordApp = New-Object -COM Word.Application
$file = (dir SampleReport.docx).FullName

$doc = $wordApp.Documents.Open($file)
$text = $doc.Content.Text
$text

$wordApp.Quit()