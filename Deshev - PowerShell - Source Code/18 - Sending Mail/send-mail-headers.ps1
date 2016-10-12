param($to = $(throw "'to' cannot be null"), 
    $cc = @(),
    $bcc = @(),
    [string] $subject = "(no subject)", 
    [string] $body = "",
    $priority = $null,
    [string]$replyTo = "",
    $extraHeaders = @())
    
. .\mailutils-headers.ps1

$message = Create-Message $to $cc $bcc $subject $body
Set-Headers $message $priority $replyTo $extraHeaders
Send-Message $message

#$message.Priority = [System.Net.Mail.MailPriority] "High"
#$message.ReplyTo = "test2@deshev.com"

# .\send-mail-headers.ps1 -to "Test User2 <test@deshev.com>" -subject '[URGENT]headers test'-body 'Please reply ASAP!' -priority High -replyTo "test2@deshev.com" -extraHeaders @(@{HeaderName="Disposition-Notification-To"; HeaderText="test@deshev.com"}, @{HeaderName="Custom-Header"; HeaderText="PowerShell test mail"})

#.\send-mail-headers.ps1 -to "Test User2 <test@deshev.com>" `
    # -subject 'important event'-body 'Event info...' -extraHeaders `
    # @(@{HeaderName="Disposition-Notification-To"; `
        # HeaderText="test@deshev.com"}, 
        # @{HeaderName="Custom-Header"; HeaderText="PowerShell test mail"})