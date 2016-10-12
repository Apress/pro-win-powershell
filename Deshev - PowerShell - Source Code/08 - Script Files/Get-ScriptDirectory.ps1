function Get-ScriptDirectory
{
    $invocation = $script:MyInvocation
    Split-Path $invocation.MyCommand.Path
}

Write-Host (Get-ScriptDirectory)