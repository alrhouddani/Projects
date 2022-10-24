function disable-account {


    # """Method disable-account disables an AD user.
    # Keyword arguments:
    # username -- ou """

    try {
        $disabled = (get-aduser -Identity $username -properties Enabled).Enabled
    }
    catch {
        {}
    }
    if ($disabled -eq $false -and $username -eq $User) {
        Write-Warning "$username the Active Directory account is already disabled"
        break
    }

    $User = (Get-aduser -LDAPFilter "(SAMAccountName=$username)").SamAccountName 

    If ($Null -ne $User -and $username -eq $user) {

        ForEach ($user in $username) {
            
            try {
                $ADGroups = Get-ADPrincipalGroupMembership -Identity  $user | Where-Object { $_.Name -ne “Domain Users” }
                Remove-ADPrincipalGroupMembership -Identity  $user -MemberOf $ADGroups -Confirm:$false -verbose 
                Write-host "$username is Removed from all groups Except the Default" -fore green
            }
            catch {

                { Write-Warning "the $username is not added to any Active Directory groups" }
            }

        }

        ForEach ($user in $username -and $disabled -eq $true) { 
            $user = Get-ADUser $username
            Disable-ADAccount $user
            Move-ADObject $user -TargetPath 'OU=Disbaled,DC=dev,DC=com'
            Write-host "$user the Active Directory account is disabled successfully" -ForegroundColor Green
            Set-ADUser -Identity $username -Description "Disabled as per $change on the $date"

        }
    }
    elseif ($User -ne $username) { Write-Warning "The user $username cannot be Disabled because it can not be found in Active Directory" }

    
}


