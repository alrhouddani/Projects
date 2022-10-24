# Input parametrs for cli:
# - account Use an ad account
# - Group use a Aactive decrtoy group
# - Options: remove or add a user to an AD group.
# - Create an ad account: run To run: .\Create_or_Remove_Account.ps1 -FirstName "firstname of the user" -LastName "LastName of the user" -option  create
# - Disable an ad account: run To run: .\Create_or_Remove_Account.ps1 -username "SamAccountName" -change cchn11 -option  remove

param(

    [Parameter(Mandatory = $true,
        ParameterSetName = 'create')][string] $FirstName = $null,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'create')][string] $LastName = $null,
    [parameter(mandatory)] [string] $username = $null,
    [parameter(mandatory)] [string] $change = $null,
    [parameter(mandatory)] [string] [string] $option,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'create')][string] $type = $null
   
)

Import-Module ActiveDirectory


$Password = ("!@#$%^&*0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz".tochararray() | Sort-Object { Get-Random })[0..9] -join ''


try {

    $User = (Get-aduser -LDAPFilter "(SAMAccountName=$username)").SamAccountName
}
catch {
    Write-Host "Exception String: $($_.Exception.Message)"
    Write-Warning "The user $user can not be created because $firstname.$lastname already exist in Active Directory"
}

function add-disabled-worknote {
    $date = Get-Date

    Set-ADUser Ronnie -Description "DISABLED $date as per $change"
}

function new-BEHaccount {
   
    $Params = @{
        Path                  = 'Domain1.Local/Productie/BeheerPartij1/Accounts/Administrators'
        SamAccountName        = $username
        Description           = "$firstname $lastname"
        Name                  = "$($FirstName) $($LastName)"
        GivenName             = $FirstName
        Surname               = $LastName
        DisplayName           = "$($FirstName) $($LastName)"
        UserPrincipalName     = "$Name@domain1.local"
        AccountPassword       = (ConvertTo-SecureString -AsPlainText "$Password" -Force)
        ChangePasswordAtLogon = $false
        Enabled               = $true
    }
   
    $User = Get-ADUser -LDAPFilter "(sAMAccountName=$Username)"
    if ($Null -eq $User) {
        $date = Get-Date
        New-ADUser @Params           
        Write-host "The Active Directory account $Username is created successfully" -ForegroundColor green
        get-aduser -Identity $Username | Select-Object SamAccountName, Enabled, DistinguishedName | Format-Table -AutoSize

        Set-ADUser $Username -Replace @{info = "Created as per $change on the $date" } 
    }
    else {

        write-Warning "user $Username can not be created because $firstname.$lastname already exist in Active Directory"
            
    }
        
}

function new-atosadmin {
   
    $Params = @{
        Path                  = 'Domain1.Local/Admin/AccAdm/Users/WSSU'
        SamAccountName        = $username
        Description           = "$firstname $lastname"
        Name                  = "$($FirstName) $($LastName)"
        GivenName             = $FirstName
        Surname               = $LastName
        DisplayName           = "$($FirstName) $($LastName)"
        UserPrincipalName     = "$Name@domain1.local"
        AccountPassword       = (ConvertTo-SecureString -AsPlainText "$Password" -Force)
        ChangePasswordAtLogon = $false
        Enabled               = $true
    }
   
    $User = Get-ADUser -LDAPFilter "(sAMAccountName=$Username)"
    if ($Null -eq $User) {
        $date = Get-Date
        New-ADUser @Params           
        Write-host "The Active Directory account $Username is created successfully" -ForegroundColor green
        get-aduser -Identity $Username | Select-Object SamAccountName, Enabled, DistinguishedName | Format-Table -AutoSize

        Set-ADUser $Username -Replace @{info = "Created as per $change on the $date" } 
    }
    else {

        write-Warning "user $Username can not be created because $firstname.$lastname already exist in Active Directory"
            
    }
        
}

function new-2linesupport {
   
    $Params = @{
        Path                  = 'Domain1.Local/Admin/AccAdm/Users/2LS'
        SamAccountName        = $username
        Description           = "$firstname $lastname"
        Name                  = "$($FirstName) $($LastName)"
        GivenName             = $FirstName
        Surname               = $LastName
        DisplayName           = "$($FirstName) $($LastName)"
        UserPrincipalName     = "$Name@domain1.local"
        AccountPassword       = (ConvertTo-SecureString -AsPlainText "$Password" -Force)
        ChangePasswordAtLogon = $false
        Enabled               = $true
    }
   
    $User = Get-ADUser -LDAPFilter "(sAMAccountName=$Username)"
    if ($Null -eq $User) {
        $date = Get-Date
        New-ADUser @Params           
        Write-host "The Active Directory account $Username is created successfully" -ForegroundColor green
        get-aduser -Identity $Username | Select-Object SamAccountName, Enabled, DistinguishedName | Format-Table -AutoSize

        Set-ADUser $Username -Replace @{info = "Created as per $change on the $date" } 
    }
    else {

        write-Warning "user $Username can not be created because $firstname.$lastname already exist in Active Directory"
            
    }
        
}
function disable-account {
    try {

        $User = (Get-aduser -LDAPFilter "(SAMAccountName=$username)").SamAccountName
    }
    catch {
        Write-Host "Exception String: $($_.Exception.Message)"
        Write-Warning "The user $username cannot be disabled because it does not exist in Active Directory"
    }
    try {
        $ADGroups = Get-ADPrincipalGroupMembership -Identity  $user | Where-Object { $_.Name -ne “Domain Users” }
        Remove-ADPrincipalGroupMembership -Identity  $user -MemberOf $ADGroups -Confirm:$false
        Write-host "$user is Removed from all Active Directory groups Except the Default" -fore green
        Set-ADUser $user -Replace @{info = "Disabled as per $change on the $date" } 
    }
    catch {
 
        if ($user -eq $username)
        { Write-Warning "the $user is not added to any Active Directory groups." }
    }

    if ($username -eq $User) {
        ForEach ($user in $user) { 
            $user = Get-ADUser $username
            Disable-ADAccount $user
            Move-ADObject $user -TargetPath 'Domain1.Local/Admin/Disabled Objects'
            get-aduser -Identity $username | Select-Object SamAccountName, Enabled, DistinguishedName | Format-Table -AutoSize
        }
    }

    try { 
        $disabled_user = get-aduser $username -properties *
        if (($disabled_user).enabled -eq $false) {
            Write-host "$username the Active Directory account is disabled successfully" -ForegroundColor Green
        }
    }
    catch {

        Write-Warning "The user $username cannot be disabled because it does not exist in Active Directory"

    }
}



switch ($option) {


    'create' {

        switch ($type) {
            'atos-admin' { 
                new-atosadmin
                
            }
            '2line-support' { 
                new-2linesupport 
               
            }
            'BEH-account' { 
                new-BEHaccount
                
            }
        }

    }
    'remove' {
        switch ($type) {
            'atos-admin' { 
                disable-account
                add-disabled-worknote 
            }
            '2line-support' { 
                disable-account
                add-disabled-worknote
            }
            'BEH-account' { 
                disable-account
                add-disabled-worknote
            }
        }
    }


    

}