param($to = $(throw "'to' cannot be null"), 
    $cc = @(),
    $bcc = @(),
    [string] $subject = "(no subject)", 
    [string] $body = "",
    [string] $htmlBody = "",
    $priority = $null,
    [string]$replyTo = "",
    $extraHeaders = @(),
    $attachments = @(),
    $linkedResources = @())
    
. .\mailutils-final.ps1

$message = Create-Message $to $cc $bcc $subject
Set-MessageBody $message $body $htmlBody
Set-Headers $message $priority $replyTo $extraHeaders
Set-Attachments $message $attachments
Set-LinkedResources $message $linkedResources
Send-Message $message

# .\send-mail-final.ps1 -subject 'Everything and the kitchen sink' `
    # -to "Test User <test@deshev.com>" `
    # -cc "Hristo Deshev <hristo@deshev.com>" `
    # -bcc "Test User2 <test2@deshev.com>" `
    # -body "Here is a sample chart" `
    # -htmlBody "<p>Here is a sample chart:</p><img src='cid:chart' />" `
    # -attachments @("C:\PowerShell\kill.log", "C:\PowerShell\test.txt") `
    # -linkedResources (@{File="C:\PowerShell\chart.png"; ContentId="chart"})`
    # -priority "High" `
    # -replyTo "test2@deshev.com" `
    # -extraHeaders @(@{HeaderName="Disposition-Notification-To"; `
        # HeaderText="test@deshev.com"})