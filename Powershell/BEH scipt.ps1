# list of all OUS in the searchbase.
$ComputersOU =
"OU=Laptops,OU=MobileDevices,OU=Computers,OU=Managed,DC=BEHMHT,DC=net",
"OU=Desktops,OU=Computers,OU=Managed,DC=BEHMHT,DC=net"

# looping over the OUS to find all Disabled AD computers. 
foreach ($ou in $ComputersOU) {

    $computernames = (Get-ADComputer -SearchBase $ou -Filter { (Enabled -eq $False) }).name
}
# Movng all Disabled AD computers to the Disabled OU. 
foreach ($computer in $computernames) {
    $asset = Get-ADComputer $computer
    Move-ADObject -Identity $asset -TargetPath "OU=Disabled,OU=Computers,OU=Managed,DC=BEHMHT,DC=net"
    Write-host $computer "is added to the Disabled OU" -fore green
}


