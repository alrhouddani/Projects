# - Input parametrs for cli:
# - Account Use an Active Directory username(SamAccountName)
# - Group use an Active Directory group
# - Option pick which option remove or add a user to an AD group.
# - To Add a user: run: .\add_remove_account_to_group..ps1 -account username -group landscape_adgroup -change "change requst number" -option Add
# - To remove a user: run: .\add_remove_account_to_group..ps1 -account username -group landscape_adgroup -change "change requst number" -option remove

param(

    [Parameter(Mandatory)] [string] $object = $null,
    [Parameter(Mandatory)] [string] $group = $null,
    [parameter(mandatory)] [string] $option # remove or add
   
)

Import-Module ActiveDirectory

#Checking if AD group is valid then add account

try {

    $members = (Get-ADGroupMember -Identity $group -Recursive).name
}
catch {
    
    Write-Warning "user can not be added to $group because $group does not exist in Active Directory."
}
#Checking if AD group is valid

$adgroup = (Get-ADGroup -LDAPFilter "(SAMAccountName=$group)").SamAccountName

#Checking if AD account  is valid

$adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$object)").SamAccountName

#Checking if AD computer is valid
$Adcomputer = (Get-adcomputer -LDAPFilter "(Name=$computer)").name


if ($object -ne $adaccount -and $adcomputer -ne $object) {
    
    Write-Host "The Active Directory object: $object does not exist in Active Directory." -ForegroundColor red
    break  
}
elseif ($group -ne $adgroup) {

    Write-Host "The Active Directory object: $group does not exist in Active Directory." -ForegroundColor red
    break
}

