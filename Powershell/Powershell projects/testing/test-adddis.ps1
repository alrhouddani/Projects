
# Input parametrs for cli:
#
# - account Use an ad account
# - Group use a Aactive decrtoy group
# - Option pick which opetion remove or add a user to an AD group.
# To run: .\aCreateModifyRemoveAccount.ps1 -FirstName firstname -LastName lastname -change cchn11 -option  create, modify or remove

        
param(

    [Parameter(Mandatory = $true,
        ParameterSetName = 'create')][string] $FirstName = $null,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'create')][string] $LastName = $null,
    [parameter(mandatory)] [string] $username = $null,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'remove')][string] $change = $null,
    [parameter(mandatory)] [string] [string] $option
   
)

Import-Module ActiveDirectory

$date = Get-Date

try {

    $User = (Get-aduser -LDAPFilter "(SAMAccountName=$username)").SamAccountName
}
catch {
    Write-Host "Exception String: $($_.Exception.Message)"
    Write-Warning "The user $user can not be created because $firstname.$lastname already exist in Active Directory"
}

function new-account {
    $Groups = @("Test-AD-Group", "Administrators")
    $Params = @{
        Path                  = 'OU=test,DC=dev,DC=com'
        SamAccountName        = $username
        Description           = "$firstname $lastname"
        Name                  = "$($FirstName) $($LastName)"
        GivenName             = $FirstName
        Surname               = $LastName
        DisplayName           = "$($FirstName) $($LastName)"
        UserPrincipalName     = "$Name@domain1.local"
        EmailAddress          = "$Name@domain1.local"
        AccountPassword       = (ConvertTo-SecureString -AsPlainText "Temporary-1" -Force)
        ChangePasswordAtLogon = $true
        Enabled               = $true
    }
    #Checking if AD group is valid then add account

    if ($user -notmatch $username) {
        New-ADUser @Params           
        Write-host "The Active Directory account $user is created successfully" -ForegroundColor green
        get-aduser -Identity $username | Select-Object SamAccountName, Enabled, DistinguishedName | Format-Table -AutoSize
        try {
            Set-ADUser $user -Replace @{info = "Created as per $change on the $date" } 
        }
        catch {
            { write-Warning "" }
        }
    }
    else {

        write-Warning "user $user can not be created because $firstname.$lastname already exist in Active Directory"
            
    }
        
           
    foreach ($group in $Groups) {

        Add-ADGroupMember -Identity $group -Members $username
            
            
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
            Move-ADObject $user -TargetPath 'OU=Disbaled,DC=dev,DC=com'
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

        Write-Warning "The user $username cannot be Disabled because it can not be found in Active Directory"

    }
}



switch ( $option ) {
    'create' { new-account }
    'remove' { disable-account }

}