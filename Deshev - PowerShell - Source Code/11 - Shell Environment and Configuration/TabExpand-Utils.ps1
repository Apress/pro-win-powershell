#save original TabExpansion function call
$global:originalExpansion = (dir Function:\TabExpansion).ScriptBlock
#cache the executables to speed up things
$global:systemExes = (dir $env:windir\system32\*.exe) | 
    foreach {$_.Name}

function global:TabExpansion($line, $lastWord)
{
    $result = @()
    #call the original tab expansion
    $result += &$originalExpansion $line $lastWord
    
    #get items in the current location and provide expansions
    $currentLocationItems = Get-ChildItem * | foreach { $_.Name }
    foreach ($item in $currentLocationItems)
    {
        if ($item -match "^$lastWord")
        {
            $result += ".\$item"
        }
    }
    
    #get registered cmdlets and aliases and provide expansions
    $commands = (Get-Command -type Alias) + `
                (Get-Command -type Cmdlet) | 
                    foreach { $_.Name }
    foreach ($command in $commands)
    {
        if ($command -match "^$lastWord")
        {
            $result += $command
        }
    }

    #provide expansions for the executables in C:\windows\system32
    foreach ($exe in $systemExes)
    {
        if ($exe -match "^$lastWord")
        {
            $result += $exe
        }
    }
    
    return $result
}