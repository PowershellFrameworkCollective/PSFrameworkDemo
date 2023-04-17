function Get-Beer {
	[CmdletBinding()]
	param (
		[PsfArgumentCompleter('BeerManager.Beer-Brand')]
		[string]
		$Brand = '*'
	)

	$script:beerStorage | Where-Object Brand -Like $Brand
}
