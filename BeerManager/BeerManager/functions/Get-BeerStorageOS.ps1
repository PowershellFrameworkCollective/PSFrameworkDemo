function Get-BeerStorageOS {
	[CmdletBinding()]
	param (
		[PSFComputer[]]
		$ComputerName
	)

	Invoke-PSFCommand -ComputerName $ComputerName -ScriptBlock {
		Get-CimInstance win32_OperatingSystem
	}
}