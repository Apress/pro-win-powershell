$excelApp = New-Object -COM Excel.Application
$file = (dir Agents.xlsx).FullName

$book = $excelApp.Workbooks.Open($file)

$sheet = $book.Worksheets.Item(1)
$cellRange = $sheet.Range("A1:B2")

$cells = [object[]] $cellRange.Cells
$cells | select Value2

$excelApp.Quit()

$cellRange = $null
$cells = $null
$book = $null
$sheet = $null
$excelApp = $null
[GC]::Collect()