function Define-Class($constructor)
{
    $class = New-Object PSObject
    $class | Add-Member NoteProperty Constructor $constructor
    
    $class | Add-Member ScriptMethod Create {
        $instance = New-Object PSObject

        $constructorBlock = $this.Constructor
        $this = $instance
        & $constructorBlock

        return $instance
    }
    return $class
}

function Add-Field($Name, $Value)
{
    $this | Add-Member NoteProperty $Name $Value
}

function Add-Property($Name, $Getter, $Setter)
{
    $this | Add-Member ScriptProperty $Name $Getter $Setter
}

function Add-Method($Name, $Body)
{
    $this | Add-Member ScriptMethod $Name $Body
}