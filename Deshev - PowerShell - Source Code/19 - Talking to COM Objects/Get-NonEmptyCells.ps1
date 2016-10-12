$excelApp = New-Object -COM Excel.Application
$file = (dir Agents.xlsx).FullName

$book = $excelApp.Workbooks.Open($file)

$sheet = $book.Worksheets.Item(1)

$row = 1
while($true)
{
    $firstName = $sheet.Cells.Item($row, 1).Value2
    $lastName = $sheet.Cells.Item($row, 2).Value2
    
    if (!$firstName -or !$lastName)
    {
        break;
    }
    
    "$firstName $lastName"
    $row++
}

$excelApp.Quit()
$book = $null
$sheet = $null
$excelApp = $null
[GC]::Collect()