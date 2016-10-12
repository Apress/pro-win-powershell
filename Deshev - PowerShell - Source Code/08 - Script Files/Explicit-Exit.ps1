function Verify-TextFile($file)
{
    if (!$file.EndsWith(".txt"))
    {
        Write-Host "$file is not a text file"
        exit
    }
}

$files = "Names.txt", "Names.doc", "Names2.xls"
foreach ($file in $files)
{
    Verify-TextFile $file
}