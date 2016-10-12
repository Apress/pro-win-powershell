param ($where, $what)

if (!$what -match "\.mp3$")
{
    $what = $what + ".mp3"
}
Get-ChildItem $where $what -Recurse