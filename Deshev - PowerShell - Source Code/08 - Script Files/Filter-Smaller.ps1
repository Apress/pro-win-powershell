param ($sizeLimit)

begin
{
}

process
{
    if ($_.Length -ge $sizeLimit)
    {
        $_
    }
}

end
{
}