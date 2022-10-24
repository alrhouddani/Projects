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
    Write-Host "Exception String: $($_.Exception.Message)"
    Write-Warning "user can not be added to $group because $group
    does not exist in Active Directory."
}
#Checking if AD group is valid

$adgroup = (Get-ADGroup -LDAPFilter "(SAMAccountName=$group)").SamAccountName

#Checking if AD account  is valid

$adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$account)").SamAccountName

switch ( $option ) {

    'remove' {
        function remove {
            param (
                $account,
                $adaccount,
                $adgroup)

            if ($members -contains $account -and $account -eq $adaccount -and $group -eq $adgroup) {

                Write-Host "The account: $account is removed from AD Group: $group " -ForegroundColor green
                Remove-ADGroupMember -Identity $group -Members $account -Confirm:$false
                Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }

            }if ($members -notcontains $account -and $account -eq $adaccount -and $group -eq $adgroup ) {

                Write-Host "The account: $account is not a member of  AD Group: $group " -ForegroundColor red

            }if ($account -ne $adaccount -and $group -eq $adgroup ) {
        
                Write-Host "The account: $account is not valid" -ForegroundColor red

            }if ($group -ne $adgroup -and $account -eq $adaccount) {

                Write-Host "The group: $group is not valid " -ForegroundColor red

            }if ($account -ne $adaccount -and $group -ne $adgroup) {


                Write-Host "Both $account and $group are not valid " -ForegroundColor red

            } 
            
            
        }

        
    }
    'add' {
       

        if ($members -notcontains $account -and $group -eq $adgroup -and $account -eq $adaccount) {

            Write-Host "The account: $account is added as member of the AD Group: $group " -ForegroundColor green
            Add-ADGroupMember -Identity $group -Members $account
            Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        
        }if ($members -contains $account -and $group -eq $adgroup -and $account -eq $adaccount ) {

            Write-Host "The account: $account is already a member of the AD Group: $group " -ForegroundColor Red
            Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }

        }if ($account -ne $adaccount -and $group -eq $adgroup ) {
            
            Write-Host "The account: $account is not valid" -ForegroundColor red

        }if ($group -ne $adgroup -and $account -eq $adaccount) {

            Write-Host "The group: $group is not valid " -ForegroundColor red

        }if ($account -ne $adaccount -and $group -ne $adgroup) {


            Write-Host "Both $account and $group are not valid " -ForegroundColor red

        } 
    }

}