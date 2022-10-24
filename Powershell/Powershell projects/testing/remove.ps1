
#Disbale AD account 

function disable-account {

    $User = Get-ADUser -LDAPFilter "(sAMAccountName=$username)"

    If ($Null -ne $User) {

        ForEach ($user in $username) {
            Write-host  $user is member of these AD Groups -fore green
            Get-ADPrincipalGroupMembership -Identity  $user | Format-Table -Property name

            try {
                ADGroups = Get-ADPrincipalGroupMembership -Identity  $user | Where-Object { $_.Name -ne “Domain Users” }
                Remove-ADPrincipalGroupMembership -Identity  $user -MemberOf $ADGroups -Confirm:$false -verbose 
                Write-host "$user is Removed from all groups Except the Default" -fore green
            }
            catch {

                { Write-Warning "the $user is not added to any Active Directory groups." }
            }


        }

        ForEach ($user in $username) { 
            $user = Get-ADUser $user
            Disable-ADAccount $user
            Move-ADObject $user -TargetPath 'OU=Disbaled,DC=dev,DC=com'
            Write-host "$username the Active Directory account is disabled successfully" -ForegroundColor Green
        }
    }
}






