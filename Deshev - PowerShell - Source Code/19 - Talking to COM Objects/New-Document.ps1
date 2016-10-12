param ($path, $text)

$wordApp = New-Object -COM Word.Application

#delete the file if it already exists
if (Test-Path $path)
{
    del $path
}

$doc = $wordApp.Documents.Add()
$doc.Content.Text = $text
$doc.SaveAs([ref] $path)

$wordApp.Quit()