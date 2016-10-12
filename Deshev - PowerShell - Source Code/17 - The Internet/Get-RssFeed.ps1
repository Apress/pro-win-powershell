#RDF: http://rss.slashdot.org/Slashdot/slashdot
#RSS 2.0: http://blogs.msdn.com/powershell/rss.xml
#Atom: http://blogs.msdn.com/powershell/atom.xml
param ($url)

$client = New-Object System.Net.WebClient

$contents = $client.DownloadString($url)
$feed = [xml] $contents

function Get-RdfPosts($feed)
{
    $feed.RDF.item | foreach {         
        @{ "Title" = $_.title; "Body" = $_.description }
    }
}

function Get-AtomPosts($feed)
{
    $feed.feed.entry | foreach { 
        @{ "Title" = $_.title; "Body" = $_.content.$("#text")  }
    }
}

function Get-RssPosts($feed)
{
    $feed.rss.channel.item | foreach {         
        @{ "Title" = $_.title; "Body" = $_.description }
    }
}

if ($feed.feed -ne $null)
{
    Get-AtomPosts $feed
}
elseif ($feed.rss -ne $null)
{
    Get-RssPosts $feed
}
elseif ($feed.RDF -ne $null)
{
    Get-RdfPosts $feed
}
else
{
    throw "Unsupported feed format"
}
