. .\Classes-SupportLib.ps1

$Person = Define-Class {
    Write-Host "Creating a Person instance"
    
    Add-Field "FirstName" "John"
    Add-Field "LastName" "Smith"
    Add-Property "FullName" `
        { 
            "$($this.FirstName) $($this.LastName)" 
        } `
        {
            $value = $args[0]
            $words = $value.Split()
            $this.FirstName = $words[0]
            $this.LastName = $words[1]
        }
        
    Add-Method "Greet" { 
        Write-Host "Hello there. I am $($this.FullName)." 
    }
}

$p = $Person.Create()
Write-Host "FullName: $($p.FullName)"
Write-Host "Changing LastName to Caulfield"
$p.LastName = "Caulfield"
Write-Host "FullName: $($p.FullName)"
Write-Host "Changing FullName to Shawn Michaels"
$p.FullName = "Shawn Michaels"
$p.Greet()