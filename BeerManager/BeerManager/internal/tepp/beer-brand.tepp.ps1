<#
# Example:
Register-PSFTeppScriptblock -Name "BeerManager.alcohol" -ScriptBlock { 'Beer','Mead','Whiskey','Wine','Vodka','Rum (3y)', 'Rum (5y)', 'Rum (7y)' }
#>
Register-PSFTeppScriptblock -Name 'BeerManager.Beer-Brand' -ScriptBlock {
	(Get-Beer).Brand | Sort-Object -Unique
	# Start-Sleep -Seconds 3 # What if the completion is slow?
} # -CacheDuration 8h # Cached is faster the second time, but does not refresh early