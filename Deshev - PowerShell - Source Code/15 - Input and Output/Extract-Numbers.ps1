$nums = .\Get-ContentAsString.ps1 .\test_numbers.txt
$numberMatcher = [regex] "\d+"

$matches = $numberMatcher.Matches($nums)
foreach ($match in $matches)
{
    if ($match.Success)
    {
        $number = $match.Groups[0].Value
        Write-Host "number: $number"
    }
}