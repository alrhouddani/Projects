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

    
    $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName
}
catch {
    
    Write-Warning "user can not be added to $group because $object does not exist in Active Directory."
}
#Checking if AD group is valid

$adgroup = (Get-ADGroup -LDAPFilter "(SAMAccountName=$group)").SamAccountName

#Checking if AD account  is valid

$adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$object)").SamAccountName 

#Checking if AD computer is valid

$Adcomputer = (Get-adcomputer -LDAPFilter "(SamAccountName=$object)").SamAccountName

if ($object -ne $adaccount -and $adcomputer -ne $object) {
    
    Write-Host "The Active Directory object: $object does not exist in Active Directory." -ForegroundColor red
    break  
}
elseif ($group -ne $adgroup) {

    Write-Host "The Active Directory group: $group does not exist in Active Directory." -ForegroundColor red
    break
}


function add-object {

    if ($object -eq $adaccount -and $adgroup -eq $group) {
        Write-Host "The account: $adaccount is added to the Active Directory Group: $group" -ForegroundColor green
        Add-ADGroupMember -Identity $group -Members $adaccount
        Get-ADPrincipalGroupMembership -Identity $adaccount | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
    }
    elseif ($object -eq $adcomputer -and $adgroup -eq $group) {
        Write-Host "The computer: $adcomputer is added to the Active Directory Group: $group" -ForegroundColor green
        Add-ADGroupMember -Identity $group -Members $adcomputer
        Get-ADPrincipalGroupMembership -Identity $adcomputer | Select-Object objectClass, SamobjectName |  Where-Object { $_.SAMobjectName -eq "$group" }
        
    }
}
function remove-object {
    if ($object -eq $adaccount -and $adgroup -eq $group) {
        Write-Host "The account: $adaccount is removed from Active Directory Group: $group" -ForegroundColor green
        Remove-ADGroupMember -Identity $group -Members $adaccount -Confirm:$false
        Get-ADPrincipalGroupMembership -Identity $adaccount | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
    }
    elseif ($object -eq $adcomputer -and $adgroup -eq $group) {
        Write-Host "The computer: $adcomputer is removed from Active Directory Group: $group" -ForegroundColor green
        Remove-ADGroupMember -Identity $group -Members $adcomputer -Confirm:$false
        Get-ADPrincipalGroupMembership -Identity $adcomputer | Select-Object objectClass, SamobjectName |  Where-Object { $_.SAMobjectName -eq "$group" }

    }
}
function Write-alreadymember {
    if ($object -eq $adaccount) {
        Write-Host "The account: $adaccount is already a member of the Active Directory Group: $group " -ForegroundColor Red
        Get-ADPrincipalGroupMembership -Identity $adaccount | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
    }
    elseif ($object -eq $Adcomputer) {
        Write-Host "The account: $Adcomputer is already a member of the Active Directory Group: $group " -ForegroundColor Red
        Get-ADPrincipalGroupMembership -Identity $Adcomputer | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        
    }
    
}

# function Write-computeralreadymember {
            
#     Write-Host "The account: $object is already a member of the Active Directory Group: $group " -ForegroundColor Red
#     Get-ADPrincipalGroupMembership -Identity $object$ | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
    
# }
# function Write-notmember {
 
#     Write-Host "The account: $object is not a member of Active Directory Group: $group " -ForegroundColor red
# }

# #calling all function inside a switch 

# switch ( $option ) {

#     'add' {
#         if ($members -notcontains $object -and $adgroup -eq $group) { add-account }
#         elseif ($members -contains $object -and $object -eq $adaccount) { Write-alreadymember }
#         elseif ($members -notcontains $object -and $object -eq $adcomputer -and $adgroup -eq $group ) { add-computer }
#         elseif ($members -contains $object -and $Adcomputer -eq $object) { Write-computeralreadymember }
#     }
#     'remove' {
    
#         if ($members -contains $object -and $object -eq $adaccount -and $group -eq $adgroup) { remove-account }
#         elseif ($members -notcontains $object -and $object -eq $adaccount -and $group -eq $adgroup) { Write-notmember }
#         elseif ($members -contains $object -and $object -eq $adcomputer -and $adgroup -eq $group ) { remove-computer }
        
        
#     }

# }


switch ($option) {

    'add' {
        if ($members -notcontains $object) { add-object }
        elseif ($members -contains $object) { Write-alreadymember }



    }
    'remove' { if ($members -contains $object) { remove-object } }

    
}