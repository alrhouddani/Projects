Import-Module activedirectory

$get_ADDC = (Get-ADDomainController).HostName
 
New-PSSession -ComputerName $get_ADDC
Enter-PSSession -ComputerName $get_ADDC
