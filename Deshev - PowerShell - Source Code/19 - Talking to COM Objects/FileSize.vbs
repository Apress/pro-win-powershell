Function GetFileSize(filePath)
    Dim fileSystem
    Set fileSystem = CreateObject("Scripting.FileSystemObject")
    
    Dim file
    Set file = fileSystem.GetFile(filePath)
    GetFileSize = filePath & " has " & file.Size & " bytes."
End Function
