function Create-Message($to = $(throw "'to' cannot be null"),
    $cc = @(),
    $bcc = @(),
    [string] $subject = "(no subject)")
{
    $message = New-Object System.Net.Mail.MailMessage
    $message.From = New-Object System.Net.Mail.MailAddress("test@deshev.com")

    #configure recipients
    
    $to | foreach { $message.To.Add($_) }
    $cc | foreach { $message.CC.Add($_) }
    $bcc | foreach { $message.BCC.Add($_) }

    $message.Subject = $subject
    $message.Body = $body
    return $message
}

function Set-MessageBody($message, [string] $body, [string]$htmlBody)
{
    if ($body -ne "" -and $htmlBody -ne "")
    {
        Set-MultiPartBodies $message $body $htmlBody
    }
    elseif ($body -ne "")
    {
        $message.IsBodyHtml  = $false
        $message.Body = $body
    }
    elseif ($htmlBody -ne "")
    {
        $message.IsBodyHtml  = $true
        $message.Body = $htmlBody
    }
    else
    {
        throw "Cannot send a message with an empty body!"
    }
}

function Set-Headers($message, $priority, $replyTo, $extraHeaders)
{
    if ($priority -ne $null)
    {
        $message.Priority = [System.Net.Mail.MailPriority] $priority
    }
    
    if ($replyTo -ne "")
    {
        $message.ReplyTo = $replyTo
    }
    
    $extraHeaders | foreach { 
        $message.Headers.Add($_.HeaderName, $_.HeaderText) }
}

function Set-Attachments($message, $attachedFiles)
{
    foreach ($file in $attachedFiles)
    {
        $attachment = New-Object System.Net.Mail.Attachment -argumentList $file
        $message.Attachments.Add($attachment)
    }
}

function Set-LinkedResources($message, $linkedResources)
{
    $htmlView = $message.AlternateViews | where {$_.ContentType -like 'text/html*'}
    if ($htmlView -eq $null)
    {
        throw "You need an HTML alternate view to use linked resources!"
    }
    
    foreach ($resourceInfo in $linkedResources)
    {
        $resource = New-Object System.Net.Mail.LinkedResource `
            -argumentList $resourceInfo.File
        $resource.ContentId = $resourceInfo.ContentId
        
        $htmlView.LinkedResources.Add($resource)
    }
}

function Set-MultiPartBodies($message, $body, $htmlBody)
{
    $textView = [System.Net.Mail.AlternateView]::`
        CreateAlternateViewFromString($body, "text/plain")
    $message.AlternateViews.Add($textView)
    
    $htmlView = [System.Net.Mail.AlternateView]::`
        CreateAlternateViewFromString($htmlBody, "text/html")
    $message.AlternateViews.Add($htmlView)
}

function Send-Message([System.Net.Mail.MailMessage] $message)
{
    $smtp = New-Object System.Net.Mail.SmtpClient -argumentList $smtpServer
    $smtp.Credentials = New-Object System.Net.NetworkCredential -argumentList $smtpUser,$smtpPassword
    $smtp.Send($message)
}