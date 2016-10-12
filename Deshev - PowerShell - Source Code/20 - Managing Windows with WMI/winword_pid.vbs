strComputer = "."
classNamespace = "winmgmts:\\" & strComputer & "\root\cimv2"
Set objWMIService = GetObject(classNamespace)

query = "SELECT * from Win32_Process WHERE Name = 'winword.exe'"
Set results = objWMIService.ExecQuery(query)
For Each process in results
    Wscript.Echo "ProcessId: " & process.ProcessId
Next
