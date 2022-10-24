# Input parametrs for cli:
#
# - account Use an ad account
# - Group use a Aactive decrtoy group
# - Option pick which opetion remove or add a user to an AD group.
# To run: .\aCreateModifyRemoveAccount.ps1 -FirstName firstname -LastName lastname -option  create, modify or remove


param(

    [parameter(mandatory)] [string] $username = $null,
    [parameter(mandatory)] [string] $FirstName = $null,
    [parameter(mandatory)] [string] $LastName = $null,
    [parameter(mandatory)] [string] [string] $option
   
)

Import-Module ActiveDirectory
try {

    $User = (Get-aduser -LDAPFilter "(SAMAccountName=$username)").SamAccountName
}
catch {
    Write-Host "Exception String: $($_.Exception.Message)"
    Write-Warning "user $user can not be created because $firstname.$lastname already exist in Active Directory"
}

switch ( $option ) {

    'create' {


        #creating the AD account 
     
        $Groups = @("Test-AD-Group", "Administrators")
        $Params = @{
            Path                  = 'OU=test,DC=dev,DC=com'
            SamAccountName        = $username
            Description           = "test 1"
            Name                  = "$($FirstName) $($LastName)"
            GivenName             = $FirstName
            Surname               = $LastName
            DisplayName           = "$($FirstName) $($LastName)"
            UserPrincipalName     = "$Name@dev.com"
            EmailAddress          = "$Name@dev.com"
            AccountPassword       = (ConvertTo-SecureString -AsPlainText "Temporary-1" -Force)
            ChangePasswordAtLogon = $false
            Enabled               = $true
        }
        #Checking if AD group is valid then add account

        if ($user -notmatch $username) {
            New-ADUser @Params           
            Write-host "The Active Directory account $user is created successfully" -ForegroundColor green
        }
        else {

            write-Warning "user $user can not be created because $firstname.$lastname already exist in Active Directory"

        }
        
           
        foreach ($group in $Groups) {

            Add-ADGroupMember -Identity $group -Members $username
        }
       
    }
    'modify' { 
        #modifying the AD account
    }

    'remove' { 
    
   

        try {
            $ADGroups = Get-ADPrincipalGroupMembership -Identity  $user | Where-Object { $_.Name -ne “Domain Users” }
            Remove-ADPrincipalGroupMembership -Identity  $user -MemberOf $ADGroups -Confirm:$false
            Write-host $user is Removed from all groups Except the Default -fore green
        }
        catch {
 
            Write-Warning "the $user is not added to any AD groups." 
        }

        ForEach ($user in $user) { 
            $user = Get-ADUser $username
            Disable-ADAccount $user
            Move-ADObject $user -TargetPath 'OU=Disbaled,DC=dev,DC=com'

        }

    
    }

}