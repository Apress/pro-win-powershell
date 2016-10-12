$wordApp = New-Object -COM Word.Application
$file = (dir SampleReportRed.docx).FullName

$doc = $wordApp.Documents.Open($file)

$documentFront = $doc.Content
$documentFront.End = $start.Start

$documentFront.Text = "IMPORTANT!!! Please review!`n"
$documentFront.Font.Name = "Comic Sans MS"
$documentFront.Font.ColorIndex = 6

$doc.Save()
$wordApp.Quit()