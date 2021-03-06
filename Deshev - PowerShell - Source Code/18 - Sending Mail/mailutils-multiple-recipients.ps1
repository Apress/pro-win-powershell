function Create-Message($to = $(throw "'to' cannot be null"),
    $cc = @(),
    $bcc = @(),
    [string] $subject = "(no subject)",
    [string] $body = $(throw "'body' cannot be null"))
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

function Send-Message([System.Net.Mail.MailMessage] $message)
{
    $smtp = New-Object System.Net.Mail.SmtpClient -argumentList $smtpServer
    $smtp.Credentials = New-Object System.Net.NetworkCredential -argumentList $smtpUser,$smtpPassword
    $smtp.Send($message)
}