param ([string]$source = $(read-host "Enter Event Source"))

function New-EventSource([string] $source)
{
    if(![System.Diagnostics.EventLog]::SourceExists($source))
    {
        [System.Diagnostics.EventLog]::CreateEventSource($source, `
            'Application')
    }
    else 
    {
        Write-Warning "Source $source already exists."
    }
}

trap
{
    Write-Error @"
Could not create event source. 
Make sure you run this script with Administrator privileges.
"@

    exit
}
New-EventSource $source
Write-Host "Event source $source created in the Application event log"