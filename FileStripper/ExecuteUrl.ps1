Param(
    [string]$SiteUrl,
	[string]$Username,
    [string]$Password,
	[int]$Timeout = 900 # 15 minutes
)

$currentPath = (Resolve-Path .\).Path
Write-Host "Current directory: $($currentPath)"
$executable = "$($currentPath)\curl.exe"
Write-Host "Exe location: $($executable)"

$curlCommand
if($Username -and $Password){
	$curlCommand = "'$($executable)' -sS -fail -u $($Username):$($Password) $($SiteUrl) --max-time $Timeout"
}
else{
	$curlCommand = "'$($executable)' -sS -fail $($SiteUrl) --max-time $Timeout"
}
Invoke-Expression "& $curlCommand"