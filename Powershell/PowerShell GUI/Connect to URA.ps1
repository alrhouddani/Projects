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

Start-Process -FilePath https://emea-de-090.asn.saacon.net/Citrix/SaaconV4/auth/login.aspx`

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

