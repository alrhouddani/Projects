
#Main paremeters to pass whehn runing the script on terminal.

param(

    [Parameter(Mandatory = $true)]
    [string] $account = $null,
    [Parameter(Mandatory = $true)]
    [string] $group = $null
)

$ErrorActionPreference = 'SilentlyContinue'

#Checking if AD group is valid then add account

$members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName

#Checking if AD group is valid

$adgroup = (Get-ADGroup -LDAPFilter "(SAMAccountName=$group)").SamAccountName

#Checking if AD account  is valid
$adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$account)").SamAccountName


if ($members -contains $account -and $account -eq $adaccount -and $group -eq $adgroup) {

    Write-Host "The account: $account is removed from AD Group: $group " -ForegroundColor green
    Remove-ADGroupMember -Identity $group -Members $account -Confirm:$false
    Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }

}if ($members -notcontains $account -and $account -eq $adaccount -and $group -eq $adgroup ) {

    Write-Host "The account: $account is not a member of  AD Group: $group " -ForegroundColor red

}if ($account -ne $adaccount -and $group -eq $adgroup ) {
    s
    Write-Host "The account: $account is not valid" -ForegroundColor red

}if ($group -ne $adgroup -and $account -eq $adaccount) {

    Write-Host "The group: $group is not valid " -ForegroundColor red

}if ($account -ne $adaccount -and $group -ne $adgroup) {

    Write-Host "Both $account and $group are not valid " -ForegroundColor red
}