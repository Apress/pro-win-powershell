. .\Classes-SupportLib.ps1

$Person = Define-Class {
    Write-Host "Creating a Person instance"
}

$p = $Person.Create()