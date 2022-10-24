# Input parametrs for cli:
# - account Use an ad account
# - Group use a Aactive decrtoy group
# - Options: remove or add a user to an AD group.
# - Create an ad account: run To run: .\Create_or_Remove_Account.ps1 -FirstName "firstname of the user" -LastName "LastName of the user" -change "change requst number" -option  create -type 
#"atos-admin or 2line-support or beh-account"
# - Disable an ad account: run To run: .\Create_or_Remove_Account.ps1 -username "SamAccountName" -change cchn11 -option  remove


param(

    [Parameter(Mandatory = $true,
        ParameterSetName = 'create')][string] $FirstName = $null, #first name of the user
    [Parameter(Mandatory = $true,
        ParameterSetName = 'create')][string] $LastName = $null, #last name of the user
    [Parameter(Mandatory = $true,
        ParameterSetName = 'create')][string] $type = $null, # type selection #"atos-admin or 2line-support or beh-account"
    [parameter(mandatory)] [string] $username = $null, # the SamAccountName
    [parameter(mandatory)] [string] $change = $null, # number of the change requst number
    [parameter(mandatory)] [string] $option = $null, # create or remove option
    [Parameter(ParameterSetName = 'remove')][string] $notneeded = $null # not in use.

   
)
# OU for each type of account for all the DistinguishedNames
switch ($type) {
    'atos-admin' { $ou = 'OU=Atos Admin accounts,DC=dev,DC=com' }
    '2line-support' { $ou = 'OU=BEH accounts,DC=dev,DC=com' }
    'beh-account' { $ou = 'OU=2nd line support engineers,DC=dev,DC=com' }
}
#global for setting up random password.

$Password = ("!@#$%^&*0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz".tochararray() | Sort-Object { Get-Random })[0..9] -join ''
$date = Get-Date

#creating new ad user function. 
function new-account {
    
    #Method new-account creates an AD user.
    #Keyword arguments:
    #username -- ou


    $Params = @{
        Path                  = $ou
        SamAccountName        = $username
        Description           = $username
        Name                  = $username
        GivenName             = $FirstName
        Surname               = $LastName
        DisplayName           = $username 
        UserPrincipalName     = "$username@dev.com"
        AccountPassword       = (ConvertTo-SecureString -AsPlainText "$Password" -Force)
        ChangePasswordAtLogon = $true  
        Enabled               = $true
    }


    $User = Get-ADUser -LDAPFilter "(sAMAccountName=$username)"

    If ($Null -eq $User) {

        New-ADUser @Params

        Set-ADUser $username -Replace @{info = "Created as per $change on the $date" }
        Get-ADUser $username -Properties Info | Select-Object Name, Info, Enabled, DistinguishedName

        Write-host "The Active Directory account $user is created successfully" -ForegroundColor green
        Write-Host "Username: $username and Password: $password" -ForegroundColor green
    }
    Else {
        Write-Warning "The user $user can not be created because $firstname.$lastname already exist in Active Directory"
        Get-ADUser $username -Properties Info | Select-Object Name, Info, Enabled, DistinguishedName
        break
    } 
}

#Disbale AD account 

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

#calling new-account and disable-account functions (Main)

switch ( $option ) {
    'create' { new-account }
    'remove' { disable-account }

}


#created by 

# Abdellah Rhouddani
# email : Abdellah.rhouddani@atos.net
# DevOps Engineer – CO&A1 Automation
# ul.Kraszewskiego 1 – 85-240 Bydgoszcz – Poland

          
