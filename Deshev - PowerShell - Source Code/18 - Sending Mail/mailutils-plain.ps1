function Create-Message([string] $to = $(throw "'to' cannot be null"), 
    [string] $subject = "(no subject)", 
    [string] $body = $(throw "'body' cannot be null"))
{
    $message = New-Object System.Net.Mail.MailMessage
    $message.From = New-Object System.Net.Mail.MailAddress `
        ("test@deshev.com")

    #configure recipients
    $message.To.Add($to)

    $message.Subject = $subject
    $message.Body = $body
    
    return $message
}

function Send-Message([System.Net.Mail.MailMessage] $message)
{
    $smtp = New-Object System.Net.Mail.SmtpClient -argumentList $smtpServer
    $smtp.Credentials = New-Object System.Net.NetworkCredential -argumentList `
        $smtpUser,$smtpPassword
    $smtp.Send($message)
}