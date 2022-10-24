
#start and connect to Pulse
Start-Process -FilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Pulse Secure\Pulse Secure.lnk"
Set-Clipboard -Value '19821991'
Start-Sleep 10
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("f")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{DOWN}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{RIGHT}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{ENTER}")
Start-Sleep 10
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("^+v")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{ENTER}")

Start-Sleep 15
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("c")

Start-Sleep 30
#connect to Saacon

Start-Process -FilePath https://emea-de-090.asn.saacon.net/Citrix/SaaconV4/auth/login.aspx

Start-Sleep 10

$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{ENTER}")

Set-Clipboard -Value '19821991'

Start-Sleep 5

$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("^+v")

Start-Sleep 5

$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{ENTER}")

Start-Sleep 10

$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{TAB}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{TAB}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{TAB}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{ENTER}")

Start-Sleep 10
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{TAB}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{TAB}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{TAB}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{TAB}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{TAB}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{TAB}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{TAB}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{ENTER}")

Start-Sleep 20

#start and login to Snow.
Start-Process -FilePath https://atoseuprod.service-now.com
Start-Sleep 15
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{TAB}")
Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{ENTER}")

Start-Sleep 2
$myshell = New-Object -com "Wscript.Shell"
$myshell.sendkeys("{ENTER}")

Start-Sleep 15

#Start all other applications.

$starts = Get-Content -Path "C:\Users\a769334\OneDrive - Atos\Documents\Start.txt"
Foreach($start in $starts) {
Start-Process -FilePath $start
}

Start-Process -FilePath "C:\Users\a769334\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Microsoft Teams.lnk"
#Start-Process -FilePath "C:\Users\a769334\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Chrome Apps\Google Keep.lnk"
