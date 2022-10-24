Write-Error 
Write-Warning
Write-Progress -Activity "Search in progress" -Status "$I% completed" -PercentComplete $i
Write-Output "here"
Write-Information "here"
Get-ChildItem | Out-GridView -Title Folders
$test = Read-Host -Prompt "test" -AsSecureString
[int]$test = Read-Host "test"
$cerd = Get-Credential
Write-Output $cerd
Get-ChildItem | select-object Mode,LastWriteTime | ConvertTo-Html | Out-File "C:\Users\a769334\OneDrive - Atos\Desktop\test.html"
Invoke-Item -Path "C:\Users\a769334\OneDrive - Atos\Desktop\test.html" 
Show-Command | Out-GridView
Get-Service -Name *docker*

Get-NetFirewallRule -Name * | Where-Object {$_.Enabled -eq "false"} | select-object name, Enabled, Action
Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
test-path 
set-content $path ((get-content $path ) -replace '"')
