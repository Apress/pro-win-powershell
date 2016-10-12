param($to = $(throw "'to' cannot be null"),
    $cc = @(),
    $bcc = @(),
    [string] $subject = "(no subject)", 
    [string] $body = "",
    [string] $htmlBody = "")
    
. .\mailutils-multipart.ps1

$message = Create-Message $to $cc $bcc $subject
Set-MessageBody $message $body $htmlBody
Send-Message $message

# .\send-mail-multipart.ps1 -to test@deshev.com -subject "multipart message" `
    # -body "Very important!" `
    # -htmlBody "<span style='color: red;'><u>very</u> important</span>"