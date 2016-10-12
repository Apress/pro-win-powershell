param([string] $to = $(throw "'to' cannot be null"), 
    [string] $subject = "(no subject)", 
    [string] $body = $(throw "'body' cannot be null"))
    
. .\mailutils-plain.ps1

$message = Create-Message $to $subject $body

Send-Message $message

# .\send-mail-plain.ps1 -to test@deshev.com -subject "Look, Ma" `
#   -body "I'm a reusable script!"