param([string] $to = $(throw "'to' cannot be null"), 
    [string] $subject = "(no subject)", 
    [string] $body = "",
    [string] $htmlBody = "")
    
. .\mailutils-html.ps1

$message = Create-Message $to $subject $body
Set-MessageBody $message $body $htmlBody
Send-Message $message