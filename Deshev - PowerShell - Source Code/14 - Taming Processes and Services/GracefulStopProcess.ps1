$notepad = Get-Process notepad

echo "Trying to close the process window..."
$messageSent = $notepad.CloseMainWindow()
sleep 2
if (!$notepad.HasExited)
{
    echo "Forcing process termination."
    Stop-Process -input $notepad
}
else
{
    echo "Process exited gracefully"
}