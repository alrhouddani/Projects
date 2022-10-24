function remove-bulk-group-user {

    
    $account = $adobject
    $groups = Get-Content -Path $group
    $adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$account)").SamAccountName 
    if ($account -ne $adaccount) {
        Write-Host "The Active Directory account: $account does not exist in Active Directory." -ForegroundColor red
        break
    }
    foreach ($group in $groups) {


        $adgroup = (Get-ADGroup -LDAPFilter "(SAMAccountName=$group)").SamAccountName

        try {
            $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName -ErrorAction SilentlyContinue
        }
        catch {
            Write-Host "The Active Directory group: $group does not exist in Active Directory." -ForegroundColor red
     
        }
        if ($members -contains $account) {
            Write-Host "The account: $account is removed from Active Directory Group: $group" -ForegroundColor green
            Remove-ADGroupMember -Identity $group -Members $account -Confirm:$false
            Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName | Where-Object { $_.SAMAccountName -eq "$group" } 
        }
    }
    elseif ($members -notcontains $account -and $adgroup -eq $group) {

        Write-Host "The account: $account is not a member of the Active Directory Group: $group " -ForegroundColor Red
        Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName | Where-Object { $_.SAMAccountName -eq "$group" }
    }
}


function remove-bulk-group-computer {

    
    $computer = $adobject
    $groups = Get-Content -Path $group
    $computer = $computer + '$'
    $Adcomputer = (Get-adcomputer -LDAPFilter "(SamAccountName=$computer)").SamAccountName

    if ($computer -ne $Adcomputer) {
        Write-Host "The Active Directory computer: $computer does not exist in Active Directory." -ForegroundColor red
        break 
    }

    foreach ($group in $groups) {


        $adgroup = (Get-ADGroup -LDAPFilter "(SAMAccountName=$group)").SamAccountName

        try {
            $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName -ErrorAction SilentlyContinue
        }
        catch {
            Write-Host "The Active Directory group: $group does not exist in Active Directory." -ForegroundColor red
     
        }
        if (($members -contains $computer) ) {
            try {
                Write-Host "The computer: $computer is removed from Active Directory Group: $group" -ForegroundColor green
                Remove-ADGroupMember -Identity $group -Members $computer -Confirm:$false
                Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamobjectName |  Where-Object { $_.SAMobjectName -eq "$group" } 
            }
            catch {
                {}
            }
        }
        elseif ($members -contains $computer -and $adgroup -eq $group) {

            Write-Host "The computer: $computer is not a member of the Active Directory Group: $group " -ForegroundColor Red
            Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        }
    }

}


switch ($type) {

    'user' { remove-bulk-group-user }
    'computer' { remove-bulk-group-computer }

}



