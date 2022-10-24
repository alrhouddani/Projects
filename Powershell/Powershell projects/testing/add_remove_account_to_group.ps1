# - Input parametrs for cli:
# - Account Use an Active Directory username(SamAccountName)
# - Group use an Active Directory group
# - Option pick which option remove or add a user to an AD group.
# - To Add a user: run: .\add_remove_account_to_group..ps1 -account username -group landscape_adgroup -change "change requst number" -option Add
# - To remove a user: run: .\add_remove_account_to_group..ps1 -account username -group landscape_adgroup -change "change requst number" -option remove

param(

    [Parameter(Mandatory = $true,
        ParameterSetName = 'account')][string] $account = $null,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'computer')][string] $computer = $null,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'accounts')][string] $accounts = $null,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'computers')][string] $computers = $null,
    [Parameter(Mandatory)] [string] $group = $null,
    [parameter(mandatory)] [string] $option, 
    [parameter(mandatory)] [string] $object
   
)

Import-Module ActiveDirectory

function get-group {
    $adgroup = (Get-ADGroup -LDAPFilter "(SAMAccountName=$group)").SamAccountName

    if ($group -ne $adgroup) {
        Write-Host "The Active Directory group: $group does not exist in Active Directory." -ForegroundColor red
        break 
    }
}

function get-account {

    $adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$account)").SamAccountName 
    if ($account -ne $adaccount) {
        Write-Host "The Active Directory account: $account does not exist in Active Directory." -ForegroundColor red
        break
    }
    
}


function get-computer {

    
    $computer = $computer + '$'
    $Adcomputer = (Get-adcomputer -LDAPFilter "(SamAccountName=$computer)").SamAccountName

    if ($computer -ne $Adcomputer) {
        Write-Host "The Active Directory computer: $computer does not exist in Active Directory." -ForegroundColor red
        break 
    }

}


function add-account {

    $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName

    if ($members -notcontains $account) {
        Write-Host "The account: $account is added to the Active Directory Group: $group" -ForegroundColor green
        Add-ADGroupMember -Identity $group -Members $account
        Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
    }
    elseif ($members -contains $account) {

        Write-Host "The account: $account is already a member of the Active Directory Group: $group " -ForegroundColor Red
        Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
    }

}


function add-computer {
    $computer = $computer + '$'
    $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName

    if ($members -notcontains $computer) {
        Write-Host "The computer: $computer is added to the Active Directory Group: $group" -ForegroundColor green
        Add-ADGroupMember -Identity $group -Members $computer
        Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamobjectName |  Where-Object { $_.SAMobjectName -eq "$group" } 
    
    }
    elseif ($members -contains $computer) {

        Write-Host "The account: $computer is already a member of the Active Directory Group: $group " -ForegroundColor Red
        Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        
    }


}

function remove-account { 
    $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName
    if ($members -contains $account) {
        Write-Host "The account: $account is removed from Active Directory Group: $group" -ForegroundColor green
        Remove-ADGroupMember -Identity $group -Members $account -Confirm:$false
        Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName | Where-Object { $_.SAMAccountName -eq "$group" } 
    }
    elseif ($members -notcontains $account) {
        Write-Host "The account: $account is not a member of the Active Directory Group: $group " -ForegroundColor Red
        Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName | Where-Object { $_.SAMAccountName -eq "$group" } 
    }
}

function remove-computer {
    $computer = $computer + '$'
    $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName
    if ($members -contains $computer) {
        Write-Host "The computer: $computer is removed from Active Directory Group: $group" -ForegroundColor green
        Remove-ADGroupMember -Identity $group -Members $computer -Confirm:$false
        Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamobjectName |  Where-Object { $_.SAMobjectName -eq "$group" } 
    }
    elseif ($members -notcontains $computer) {
        Write-Host "The computer: $computer is not a member of the Active Directory Group: $group " -ForegroundColor Red
        Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" } 
    }
}


function add-bulk-accounts {

    $accounts = Get-Content -Path $accounts 
    
    ForEach ($user in $accounts) {
        $adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$user)").SamAccountName 
        if ($user -ne $adaccount) {
            Write-Host "The Active Directory account: $user does not exist in Active Directory." -ForegroundColor red
            break
        }
    }

    ForEach ($user in $accounts) { 

        $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName
        if ($members -notcontains $user) {
            Write-Host "The account: $user is added to the Active Directory Group: $group" -ForegroundColor green
            Add-ADGroupMember -Identity $group -Members $user
            Get-ADPrincipalGroupMembership -Identity $user | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        }
        elseif ($members -contains $user) {

            write-Host "The account: $user is already a member of the Active Directory Group: $group " -ForegroundColor Red
            Get-ADPrincipalGroupMembership -Identity $user | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }


        }


    }
}

function remove-bulk-accounts {
    $accounts = Get-Content -Path $accounts 
    
    ForEach ($user in $accounts) {
        $adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$user)").SamAccountName 
        if ($user -ne $adaccount) {
            Write-Host "The Active Directory account: $user does not exist in Active Directory." -ForegroundColor red
            break
        }
    }

    ForEach ($user in $accounts) { 

        $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName
        if ($members -contains $user) {
            Write-Host "The account: $user is removed from Active Directory Group: $group" -ForegroundColor green
            Remove-ADGroupMember -Identity $group -Members $user -Confirm:$false
            Get-ADPrincipalGroupMembership -Identity $user | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        }
        elseif ($members -notcontains $user) {

            Write-Host "The account: $object is not a member of Active Directory Group: $group " -ForegroundColor red
            Get-ADPrincipalGroupMembership -Identity $user | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        }


    }
}




function add-bulk-computers {

    $computers = Get-Content -Path $computers 
    
    ForEach ($computer in $computers) {

        $computer = $computer + '$'
        $Adcomputer = (Get-adcomputer -LDAPFilter "(SamAccountName=$computer)").SamAccountName
        if ($computer -ne $Adcomputer) {
            Write-Host "The Active Directory computer: $computer does not exist in Active Directory." -ForegroundColor red
            break
        }
    }

    ForEach ($computer in $computers) { 

        $computer = $computer + '$'

        $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName
        if ($members -notcontains $computer) {
            Write-Host "The computer: $computer is added to the Active Directory Group: $group" -ForegroundColor green
            Add-ADGroupMember -Identity $group -Members $computer
            Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        }
        elseif ($members -contains $computer) {

            write-Host "The computer: $computer is already a member of the Active Directory Group: $group " -ForegroundColor Red
            Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        }


    }
}



function remove-bulk-computers {


    $computers = Get-Content -Path $computers 
    
    ForEach ($computer in $computers) {

        $computer = $computer + '$'
        $Adcomputer = (Get-adcomputer -LDAPFilter "(SamAccountName=$computer)").SamAccountName
        if ($computer -ne $Adcomputer) {
            Write-Host "The Active Directory computer: $computer does not exist in Active Directory." -ForegroundColor red
            break
        }
    }

    ForEach ($computer in $computers) { 

        $computer = $computer + '$'

        $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName

        if ($members -contains $computer) {
            Write-Host "The computer: $computer is removed from Active Directory Group: $group" -ForegroundColor green
            Remove-ADGroupMember -Identity $group -Members $computer -Confirm:$false
            Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        }
        elseif ($members -notcontains $computer) {

            Write-Host "The computer: $computer is not a member of the Active Directory Group: $group " -ForegroundColor Red
            Get-ADPrincipalGroupMembership -Identity $computer | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
        }


    }
}

switch ($option) {


    'add' {

        switch ($object) {
            'account' { 
                get-group
                get-account 
                add-account 
            }
            'computer' { 
                get-group 
                get-computer 
                add-computer 
            }
        }
    }
    'remove' {

        switch ($object) {
            'account' {
                get-group
                get-account 
                remove-account
            }
            'computer' {
                get-group
                get-computer
                remove-computer
            }
        }
    }
    'bulk-add' {
        switch ($object) {
            'accounts' {
                get-group
                add-bulk-accounts
            }
            'computers' {
                get-group
                add-bulk-computers
                
            }
        }
        
        
    }'bulk-remove' {
        switch ($object) {
            'accounts' {
                get-group
                remove-bulk-accounts
            }
            'computers' {  
                get-group
                remove-bulk-computers
            }

        }
    }


}

    
    


