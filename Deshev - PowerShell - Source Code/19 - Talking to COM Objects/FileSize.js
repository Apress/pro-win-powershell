function GetFileSize(filePath)
{
    var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
    var file = fileSystem.GetFile(filePath);
    return (filePath + " has " + file.Size + " bytes.");
}