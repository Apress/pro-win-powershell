trap
{
    $dumpFile = "error-dump.xml"
    $message = @"
A critical error occurred!
The error has been dumped to $dumpFile. Please include that file
in all error reports you send to scriptauthor@test.com
"@

    Write-Host $message -ForegroundColor Red
    $_ | Export-CliXml $dumpFile
    break
}

del veryimportantfile.txt -ErrorAction Stop