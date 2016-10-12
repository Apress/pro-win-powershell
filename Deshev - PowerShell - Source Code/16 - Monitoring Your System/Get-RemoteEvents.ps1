$applicationLog = Get-WmiObject Win32_NTEventLogFile `
                    -filter "LogFileName = 'Application'" `
                    -computer NULL

$startRecord = $applicationLog.NumberOfRecords - 10
$filter = "Logfile = 'Application' AND RecordNumber > $startRecord"
Get-WmiObject Win32_NTLogEvent -filter $filter `
                    -computer NULL | `
                    sort TimeGenerated -Descending