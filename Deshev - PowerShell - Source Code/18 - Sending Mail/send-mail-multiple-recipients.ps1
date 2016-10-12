param($to = $(throw "'to' cannot be null"), 
    $cc = @(),
    $bcc = @(),
    [string] $subject = "(no subject)", 
    [string] $body = "")
    
. .\mailutils-multiple-recipients.ps1

$message = Create-Message $to $cc $bcc $subject $body
Send-Message $message

#$to is no longer a string but an array
#.\send-mail-multiple-recipients.ps1 -to @("test@deshev.com", `
    # "test@deshev.com") -cc @("test@deshev.com", "test@deshev.com") `
    # -bcc @("hristo@deshev.com", "test@deshev.com") `
    # -subject 'hi everyone'-body 'test'

# $addr = New-Object System.Net.Mail.MailAddress `
#    -arg @("test@deshev.com", "Test User3")
# .\send-mail-multiple-recipients.ps1 -to $a -subject 'inline image'-body 'test'


#.\send-mail-multiple-recipients.ps1 -to "Test User2 <test@deshev.com>" `
#    -subject 'friendly name'-body 'test'