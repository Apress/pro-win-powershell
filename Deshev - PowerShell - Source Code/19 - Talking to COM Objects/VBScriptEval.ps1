$vbscript = New-Object -COM MSScriptControl.ScriptControl
$vbscript.Language = "VBScript"
$vbsLines = Get-Content "FileSize.vbs"
$vbsCode = [string]::Join("`n", $vbsLines)
$vbscript.AddCode($vbsCode)
$fileName = (dir FileSize.vbs).FullName

Write-Host "Using Eval"
$vbscript.Eval("GetFileSize(`"$fileName`")")

Write-Host "Using Run"
$vbscript.Run("GetFileSize", $fileName)