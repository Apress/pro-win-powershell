$files = dir z:\ -ErrorAction SilentlyContinue `
    -ErrorVariable errorVar
if ($errorVar)
{
    Write-Host "An error occurred getting files!"
}

del nosuchfile.txt -ErrorAction SilentlyContinue `
    -ErrorVariable errorVar
if ($errorVar)
{
    $realError = $errorVar[0]
    $realError | `
        Select FullyQualifiedErrorId,CategoryInfo,TargetObject | `
        Format-List
        
    $realError.InvocationInfo | `
        Select ScriptName,ScriptLineNumber,Line | Format-List
}