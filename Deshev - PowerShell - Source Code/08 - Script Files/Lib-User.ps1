function Get-ScriptDirectory
{
    $invocation = $script:MyInvocation
    Split-Path $invocation.MyCommand.Path
}

function Get-LibraryPath($relativePath)
{
    $dir = Get-ScriptDirectory
    return Join-Path $dir $relativePath
}

. (Get-LibraryPath "Library1.ps1")

LibHello
