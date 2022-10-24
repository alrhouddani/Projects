netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow

$Password = Read-Host -AsSecureString

New-LocalUser "alrh" -Password $Password -FullName "abdellah rhouddani" -Description "admin ansible"
Add-LocalGroupMember -Group "Administrators" -Member "alrh"

