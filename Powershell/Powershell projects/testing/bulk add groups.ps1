function Add-bulk-group-user {

    
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
        if ($members -notcontains $account) {
            try {
                Write-Host "The account: $account is added to the Active Directory Group: $group" -ForegroundColor green
                Add-ADGroupMember -Identity $group -Members $account
                Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
            }
            catch {
                {}
            }
        }
        elseif ($members -contains $account -and $adgroup -eq $group) {

            Write-Host "The account: $account is already a member of the Active Directory Group: $group " -ForegroundColor Red
            Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        }
    }

}
function Add-bulk-group-computer {

    
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
        if ($members -notcontains $computer) {
            try {
                Write-Host "The computer: $computer is added to the Active Directory Group: $group" -ForegroundColor green
                Add-ADGroupMember -Identity $group -Members $computer
                Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
            }
            catch {
                {}
            }
        }
        elseif ($members -contains $computer -and $adgroup -eq $group) {

            Write-Host "The account: $computer is already a member of the Active Directory Group: $group " -ForegroundColor Red
            Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        }
    }

}


switch ($type) {

    'user' { Add-bulk-group-user }
    'computer' { Add-bulk-group-computer }

}