. .\Classes-SupportLib.ps1

$Person = Define-Class {
    Write-Host "Creating a Person instance"
    
    Add-Field "FirstName" "John"
}

$p = $Person.Create()
$p.FirstName