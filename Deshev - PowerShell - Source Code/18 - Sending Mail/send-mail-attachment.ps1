param($to = $(throw "'to' cannot be null"), 
    $cc = @(),
    $bcc = @(),
    [string] $subject = "(no subject)", 
    [string] $body = "",
    [string] $htmlBody = "",
    $attachments = @())

. .\mailutils-attachment.ps1

$message = Create-Message $to $cc $bcc $subject
Set-MessageBody $message $body $htmlBody
Set-Attachments $message $attachments
Send-Message $message

# .\send-mail-attachment.ps1 -to "test@deshev.com" -subject "Program error" `
    # -body "Program error log and details" `
    # -attachments @("C:\PowerShell\kill.log", "C:\PowerShell\test.txt")