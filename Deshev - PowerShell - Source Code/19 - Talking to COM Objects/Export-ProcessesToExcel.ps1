$excelApp = New-Object -COM Excel.Application
$file = Join-Path (Get-Location) "Processes.xlsx"

$book = $excelApp.Workbooks.Add()

$sheet = $book.Worksheets.Item(1)

$processes = Get-Process

#set cell contents
for ($i = 1; $i -le $processes.Count; $i++)
{
    $processIdCell = $sheet.Cells.Item($i, 1)
    $processIdCell.Value2 = $processes[$i].Id
    $processNameCell = $sheet.Cells.Item($i, 2)
    $processNameCell.Value2 = $processes[$i].Name
}

$processIdCell = $null
$processNameCell = $null

#bold the A and B columns and make their text red
$columnsABRange = $sheet.Range("A:B")
$columnsABRange.Font.Bold = $true
$columnsABRange.Font.ColorIndex = 3
$columnsABRange = $null

$book.SaveAs($file)
$excelApp.Quit()

$book = $null
$sheet = $null
$excelApp = $null
[GC]::Collect()