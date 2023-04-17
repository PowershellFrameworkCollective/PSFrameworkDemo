function Remove-Beer {
	[Alias('Drink-Beer')]
	[CmdletBinding(SupportsShouldProcess = $true)]
	param (
		[PsfArgumentCompleter('BeerManager.Beer-Brand')]
		[PsfValidateSet(TabCompletion = 'BeerManager.Beer-Brand')]
		[Parameter(Mandatory = $true)]
		[string]
		$Brand,

		[Parameter(Mandatory = $true)]
		[ValidateSet('Bottle', 'Keg')]
		[string]
		$Unit,

		[Parameter(Mandatory = $true)]
		[ValidateRange(1, 666)]
		[int]
		$Count,

		[switch]
		$EnableException
	)

	Write-PSFMessage -String "Remove-Beer.Removing" -StringValues $Count, $Unit, $Brand

	$currentCount = $Count
	$options = $script:beerStorage | Where-Object Brand -EQ $Brand | Where-Object Unit -EQ $Unit
	foreach ($option in $options) {
		if ($option.Count -lt $currentCount) {
			$currentCount = $currentCount - $option.Count
			Invoke-PSFProtectedCommand -ActionString 'Remove-Beer.Removing.Actual' -ActionStringValues $Brand, $Count -Target $option -ScriptBlock {
				$script:beerStorage = $script:beerStorage | Where-Object { $_ -ne $option }
			} -PSCmdlet $PSCmdlet -Continue -EnableException $EnableException
		}
		else {
			$option.Count = $option.Count - $currentCount
			$currentCount = 0
			if (0 -eq $option.Count) {
				Invoke-PSFProtectedCommand -ActionString 'Remove-Beer.Removing.Actual' -ActionStringValues $Brand, $Count -Target $option -ScriptBlock {
					$script:beerStorage = $script:beerStorage | Where-Object { $_ -ne $option }
				} -PSCmdlet $PSCmdlet -Continue -EnableException $EnableException
			}
			break
		}
	}
	if (0 -lt $currentCount) {
		throw "Out of beer!!!"
	}
}