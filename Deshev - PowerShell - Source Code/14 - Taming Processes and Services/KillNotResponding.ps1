$before = (Get-Process | where {$_.Responding -eq $false})
sleep 5
$after = (Get-Process | where {$_.Responding -eq $false})

if (($before -ne $null) -and ($after -ne $null))
{
    diff $before $after -includeEqual | 
        where { $_.SideIndicator -eq "==" } | 
        foreach { $_.InputObject | Stop-Process }
}