$jscript = New-Object -COM MSScriptControl.ScriptControl
$jscript.Language = "JScript"
$jsLines = Get-Content "FileSize.js"
$jsCode = [string]::Join("`n", $jsLines)
$jscript.AddCode($jsCode)
$fileName = (dir FileSize.js).FullName

$fileSize = $jscript.CodeObject
$fileSize.GetFileSize($fileName)