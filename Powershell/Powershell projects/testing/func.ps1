# Input parametrs for cli:
#
# - account Use an ad account
# - Group use a Aactive decrtoy group
# - Option pick which opetion remove or add a user to an AD group.
# To run: .\add_remove_account_to_group..ps1 -account CCSS-205 -prefix S -group NONP -option  Add or remove


param(

    [Parameter(Mandatory)] [string] $account = $null,
    [Parameter(Mandatory)] [string] $group = $null,
    [parameter(mandatory)] [string] $option
   
)


#Checking if AD group is valid then add account

try {
    $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName
}
catch {
    
    Write-Warning "user can not be added to $group because $group does not exist in Active Directory."
}
#Checking if AD group is valid

$adgroup = (Get-ADGroup -LDAPFilter "(SAMAccountName=$group)").SamAccountName

#Checking if AD account  is valid

$adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$account)").SamAccountName

if ($account -ne $adaccount) {
    
    Write-Host "The Active Directory account: $account does not exist in Active Directory." -ForegroundColor red
    break  
}
elseif ($group -ne $adgroup) {

    Write-Host "The Active Directory group: $group does not exist in Active Directory." -ForegroundColor red
    break
}

function add-account {
    Write-Host "The account: $account is added to the Active Directory Group: $group" -ForegroundColor green
    Add-ADGroupMember -Identity $group -Members $account
    Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
}

function remove-account {
  
    Write-Host "The account: $account is removed from Active Directory Group: $group" -ForegroundColor green
    Remove-ADGroupMember -Identity $group -Members $account -Confirm:$false
    Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
}
function Write-alreadymember {
            
    Write-Host "The account: $account is already a member of the Active Directory Group: $group " -ForegroundColor Red
    Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
    
}
function Write-notmember {
 
    Write-Host "The account: $account is not a member of Active Directory Group: $group " -ForegroundColor red
}

#calling all function inside a switch 

switch ( $option ) {

    'add' {
        if ($members -notcontains $account -and $adgroup -eq $group) { add-account }
        elseif ($members -contains $account) { Write-alreadymember }
    }
    'remove' {
    
        if ($members -contains $account -and $account -eq $adaccount -and $group -eq $adgroup) { remove-account }
        elseif ($members -notcontains $account -and $account -eq $adaccount -and $group -eq $adgroup) { Write-notmember }
        
    }

}