$where = $args[0]
$what = $args[1]

if (!$what -match "\.mp3$")
{
    $what = $what + ".mp3"
}
Get-ChildItem $where $what -Recurse