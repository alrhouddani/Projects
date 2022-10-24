
#Main paremeters to pass whehn runing the script on terminal.

param(

    [Parameter(Mandatory = $true)]
    [string] $account = $null,
    [Parameter(Mandatory = $true)]
    [string] $group = $null
)

#Checking if AD group is valid then add account

try {
    $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName
}
catch {
    Write-Host "Exception String: $($_.Exception.Message)"
    Write-Warning "user can not be added to $group because $group
    does not exist in Active Directory."
}
#Checking if AD group is valid

$adgroup = (Get-ADGroup -LDAPFilter "(SAMAccountName=$group)").SamAccountName

#Checking if AD account  is valid

$adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$account)").SamAccountName



function remove-user {
  
    Write-Host "The account: $account is removed from AD Group: $group " -ForegroundColor green
    Remove-ADGroupMember -Identity $groupad -Members $account -Confirm:$false
    Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
}

function notmember {
 

    Write-Host "The account: $account is not a member of AD Group: $group " -ForegroundColor red
}

function accountunvalid {
  

    Write-Host "The account: $account is not valid" -ForegroundColor red
}
function groupunvalid {
 
    Write-Host "The group: $group is not valid " -ForegroundColor red
}

function bothunvalid {

    Write-Host "Both $account and $group are not valid " -ForegroundColor red
}



if ($members -contains $account -and $account -eq $adaccount -and $group -eq $adgroup) { remove-user }
if ($members -notcontains $account -and $account -eq $adaccount -and $group -eq $adgroup) { notmember }
if ($account -ne $adaccount -and $group -eq $adgroup ) { accountunvalid }
if ($account -ne $adaccount -and $group -ne $adgroup) { groupunvalid }
if ($account -ne $adaccount -and $group -ne $adgroup) { bothunvalid }
