$script:name = "Jeremiah"

function Modify-Name()
{
    $script:name = "Mike"
    Write-Host "Within script function scope: $script:name"
}

Write-Host "Original script global scope: $script:name"
Modify-Name
Write-Host "Modified script global scope: $script:name"