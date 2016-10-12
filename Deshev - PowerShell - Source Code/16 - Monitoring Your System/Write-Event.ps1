param 
(
    [string]$message = `
        $(read-host "Enter a Event Description"), 
    [string]$source = `
        $(read-host "Enter Event Source"), 
    [string]$type = `
        $(read-host "Enter Event Type [Information, Warning, Error]"), 
    [int]$eventId = `
        $(read-host "Enter EventID")
)

function Write-Event( `
        [string] $message,
        [string] $source = $(throw "Event source parameter required."),
        [System.Diagnostics.EventLogEntryType] $type,
        [int] $eventId)
{ 
    # Check if the event source actually exists.
    if(![System.Diagnostics.EventLog]::SourceExists($source))
    {
        throw "Event source $source does not exist."
    }
    
    $log = New-Object System.Diagnostics.EventLog 
    $log.Log = "Application"
    $log.Source = $source
    $log.WriteEntry($message, $type, $eventId)
}


Write-Event $message $source $type $eventId

Write-Host @"
Logged event: 
$message

Source: $source
Type: $type
Event ID: $eventId
"@