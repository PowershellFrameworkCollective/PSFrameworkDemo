# Install-Module PSModuleDevelopment
Get-Command -Module PSModuleDevelopment

Get-Command -Module PSModuleDevelopment *template*

Get-PSMDTemplate
Invoke-PSMDTemplate PSFProject

$rootPath = 'C:\code\GitHub\PSFrameworkDemo'
Split-PSMDScriptFile -File "$rootPath\oldstuff\beercommands.psm1" -Path "$rootPath\BeerManager\BeerManager\functions"

# Strings
$strings = Export-PSMDString -ModuleRoot $rootPath\BeerManager\BeerManager
$strings | Sort Language |ft Language, Line