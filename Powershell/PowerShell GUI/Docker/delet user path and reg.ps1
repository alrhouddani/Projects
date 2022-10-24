$asset = read-host "Enter Asset number"
Set-Location -Path "D:\Atos2LS\A769334 AL"
$path = "\\$asset\c$\Users\profiles.csv"
Get-ChildItem -Path "\\$asset\c$\Users" -Exclude "Public", "Administrator","profiles.txt" | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-180)} | Select-Object Name | Export-Csv $path
set-content $path ((get-content $path ) -replace '"')
$names = Get-Content -Path "\\$asset\c$\Users\profiles.csv"
foreach ($name in $names) {
    Add-Content -path "\\$asset\c$\Users\Delete.txt" "rmdir $name /s /q"}

$users = Get-Content -Path "\\$asset\c$\Users\profiles.csv"

$Output = foreach ($user in $users) {
    Get-WmiObject -Class Win32_userprofile -ComputerName $asset | Where-Object {$_.localpath -eq "C:\Users\$user"} | Select-Object SID}
$Output | Export-Csv -path "\\$asset\c$\Users\Registry.csv"

Rename-Item -Path  "\\$asset\c$\Users\Delete.txt" "Delete.cmd"

$Keys = get-content -Path "\\$asset\c$\Users\Registry.csv"
foreach($key in $Keys)
{Add-Content -path "\\$asset\c$\Users\Regdelete.txt" "reg Delete $key /f"
}
Rename-Item -Path  "\\$asset\c$\Users\Regdelete.txt" "Regdelete.cmd"
.\psexec -s \\$asset cmd 

Pause
$files = "\\$asset\c$\Users\profiles.csv","\\$asset\c$\Users\Delete.cmd","\\$asset\c$\Users\Registry.cmd","\\$asset\c$\Users\Registry.csv","\\$asset\c$\Users\Regdelete.cmd"
Remove-Item -Path $files

