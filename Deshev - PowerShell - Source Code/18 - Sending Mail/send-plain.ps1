#create the mail message
$mail = New-Object System.Net.Mail.MailMessage

#set the addresses
$mail.From = New-Object System.Net.Mail.MailAddress("test@deshev.com")
$mail.To.Add("test@deshev.com")

#set the content
$mail.Subject = "Hello PowerShell";
$mail.Body = "Sending mail is easy!";

#send the message
$smtp = New-Object System.Net.Mail.SmtpClient -argumentList "mail.deshev.com"
$smtp.Credentials = New-Object System.Net.NetworkCredential `
    -argumentList "test@deshev.com","testpass"
$smtp.Send($mail)