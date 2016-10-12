#types
(42).GetType()
"Hello, world".GetType()
(1,2,3).GetType()

#properties
"Hello".Length
#"Hello".Length = 7

$fruit = "apples", "oranges"
$fruit[0]
$fruit[1]


#methods
"Hello".Contains("Hell")
"uppercase, please".ToUpper()

#adapters
(Get-WmiObject win32_process)[0].PSBase.Properties["Caption"].Value

$user = [ADSI]"WinNT://./Hristo,user"
$user.PSBase.Properties["Name"]
$user.Name

$ds = New-Object Data.DataSet
$ds.ReadXml("C:\PowerShell\data.xml")
$ds.Tables[0].Rows[0]

$xmlDoc = New-Object Xml.XmlDocument
$xmlDoc.Load("C:\PowerShell\data.xml")
$xmlDoc.Users.User[0]

$ie = New-Object -COM InternetExplorer.Application
$ie.Visible = $true