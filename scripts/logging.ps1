Get-PSFLoggingProvider
Set-PSFLoggingProvider -Name logfile -InstanceName myLog -FilePath C:\Temp\demo\Logfile-%date%.csv -TimeFormat 'yyyy-MM-dd HH:mm:ss.fff' -Enabled $true
Set-PSFLoggingProvider -Name logfile -InstanceName myLog2 -FilePath C:\Temp\demo\Logfile-%date%.json -FileType Json -Headers 'Timestamp','Message','Level','Tags' -ExcludeTags test -UTC $true -Enabled $true