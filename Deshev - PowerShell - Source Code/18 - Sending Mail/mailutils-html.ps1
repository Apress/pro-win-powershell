function Create-Message([string] $to = $(throw "'to' cannot be null"), 
    [string] $subject = "(no subject)")
{
    $message = New-Object System.Net.Mail.MailMessage
    $message.From = New-Object System.Net.Mail.MailAddress("test@deshev.com")

    #configure recipients
    $message.To.Add($to)

    $message.Subject = $subject
    return $message
}

function Set-MessageBody($message, [string] $body, [string]$htmlBody)
{
    if ($body -ne "")
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

function Send-Message([System.Net.Mail.MailMessage] $message)
{
    $smtp = New-Object System.Net.Mail.SmtpClient -argumentList $smtpServer
    $smtp.Credentials = New-Object System.Net.NetworkCredential -argumentList $smtpUser,$smtpPassword
    $smtp.Send($message)
}