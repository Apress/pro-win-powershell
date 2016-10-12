param($to = $(throw "'to' cannot be null"), 
    $cc = @(),
    $bcc = @(),
    [string] $subject = "(no subject)", 
    [string] $body = "",
    [string] $htmlBody = "",
    $attachments = @(),
    $linkedResources = @())
    
. .\mailutils-linkedresources.ps1

$message = Create-Message $to $cc $bcc $subject
Set-MessageBody $message $body $htmlBody
Set-Attachments $message $attachments
Set-LinkedResources $message $linkedResources
Send-Message $message

# .\send-mail-linkedresources.ps1 -to test@deshev.com -subject 'inline image' `
    # -body 'test' -htmlBody `
    # '<p>Here is a sample chart:</p><img src="cid:chart" />' `
    # -linkedResources (@{File="C:\PowerShell\chart.png"; ContentId="chart"})