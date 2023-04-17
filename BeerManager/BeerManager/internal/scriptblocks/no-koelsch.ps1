Set-PSFScriptblock -Name BeerManager.NoKoelsch -Scriptblock {
	$_ -notin 'Koelsch','Kölsch'
} -Global