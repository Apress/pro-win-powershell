function Get-User
{
    [System.Security.Principal.WindowsIdentity]::GetCurrent()
}

function Is-Administrator
{
    $user = Get-User
    $principal = New-Object `
        Security.principal.windowsprincipal($user)
    $principal.IsInRole("Administrators")
}

#rename to prompt to use as a real prompt
function username_prompt
{
    $user = (Get-User).Name
    $path = Get-Location
    "[$user] $path> "
}

#rename to prompt to use as a real prompt
function unix_prompt
{
    $path = Get-Location
    $terminator = '$'
    if ((Is-Administrator))
    {
        $terminator = "#"
    }
    "$path $terminator "
}

#rename to prompt to use as a real prompt
function color_prompt
{
    Write-Host ("$(get-location)>") -nonewline `
        -foregroundcolor Yellow
    return " "
}

function prompt
{
    $user = (Get-User).Name
    $path = Get-Location
    $host.UI.RawUI.WindowTitle = $path
    "[$user]> "
}