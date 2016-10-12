$jscript = New-Object -COM MSScriptControl.ScriptControl
$jscript.Language = "JScript"
$jsLines = Get-Content "FileSize.js"
$jsCode = [string]::Join("`n", $jsLines)
$jscript.AddCode($jsCode)
$fileName = (dir FileSize.js).FullName

Write-Host "Using Eval"
$jscript.Eval("GetFileSize(`"$($fileName.Replace('\', '\\'))`")")

Write-Host "Using Run"
$jscript.Run("GetFileSize", $fileName)