$wordApp = New-Object -COM Word.Application
$doc = $wordApp.Documents.Add()
$doc.Content.Text = "this is some mistakn text"

$errors = [object[]] $doc.SpellingErrors

foreach ($errorRange in $errors)
{
    Write-Host "Error: $($errorRange.Text)"
    $suggestions = ([object[]]$errorRange.GetSpellingSuggestions()) 
    $suggestedWords = $suggestions | foreach { $_.Name }
    Write-Host "Suggestions :"
    Write-Host $suggestedWords
}

$wordApp.Quit()
