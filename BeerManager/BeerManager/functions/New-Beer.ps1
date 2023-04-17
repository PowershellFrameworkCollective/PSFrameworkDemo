function New-Beer {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[PsfArgumentCompleter('BeerManager.Beer-Brand')]
		[PsfValidateScript('BeerManager.NoKoelsch', ErrorString = 'BeerManager.NoKoelsch')]
		[string]
		$Brand,

		[ValidateSet('Bottle', 'Keg')]
		[string]
		$Unit = 'Bottle',

		[ValidateRange(1, 666)]
		[int]
		$Count = 1
	)

	$object = [PSCustomObject]@{
		PSTypeName = 'BeerManager.Beer'
		Brand      = $Brand
		Unit       = $Unit
		Count      = $Count
	}
	Add-Member -InputObject $object -MemberType ScriptMethod -Name ToString -Value {
		'{0} {1}' -f $this.Count, $this.Brand
	} -Force
	$script:beerStorage = @($script:beerStorage) + @($object)
}
