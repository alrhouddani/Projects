


function disable-bulk-accounts {
    
    $users = Get-Content  "C:\Users\Administrator\Desktop\users.txt"


    foreach ($username in $users) {


        $adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$username)").SamAccountName 
        try {
            $disabled = (get-aduser -Identity $username -properties Enabled).Enabled
        }
        catch {
            {}
        }

        if ($disabled -eq $false -and $adaccount -eq $username) {
            Write-Warning "$username the Active Directory account is already disabled"
        
        }
    
        try {
            $ADGroups = Get-ADPrincipalGroupMembership -Identity  $username | Where-Object { $_.Name -ne “Domain Users” }
            Remove-ADPrincipalGroupMembership -Identity  $username -MemberOf $ADGroups -Confirm:$false -verbose 
            Write-host "$username is Removed from all groups Except the Default" -fore green
        }
        catch {

            if ($adaccount -eq $username) { Write-Warning "the $username is not added to any Active Directory groups" }
        }

        if ($username -ne $adaccount) { Write-Host "The Active Directory user: $username does not exist in Active Directory." -ForegroundColor red }

        if ($disabled -eq $true -and $username -eq $adaccount) { 
            $user = Get-ADUser $username -ErrorAction SilentlyContinue
            Disable-ADAccount $user
            Move-ADObject $user -TargetPath 'OU=Disabled Objects,OU=Admin,DC=Domain1,DC=Local'
            Write-host "$username the Active Directory account is disabled successfully" -ForegroundColor Green
            Set-ADUser -Identity $username -Description "Disabled as per $change on the $date"

        }

    }
}

