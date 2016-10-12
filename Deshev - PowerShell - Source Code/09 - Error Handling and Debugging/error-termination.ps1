function Raise-NonTerminatingError
{
    del nosuchfile.txt
}

function Raise-TerminatingError
{
    del nosuchfile-terminating.txt -ErrorAction Stop
}

Write-Host "script start"

Raise-NonTerminatingError
Raise-TerminatingError

Write-Host "script end"