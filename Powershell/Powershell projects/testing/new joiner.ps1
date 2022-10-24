Import-Module ActiveDirectory

 
Function Email {
    $GroupBool = Read-Host "Do you want to enter a custom email (firstname.lastname@nhs.net is the default)? Y/N"
    if ($GroupBool.ToLower() -eq "y") { Read-Host "Enter the user's NHS.net email address" }else { "$name@nhs.net" }
}

Function Clip {
    $GroupBool = Read-Host "Did you create a new NHS.net email address? Y/N"
    if ($GroupBool.ToLower() -eq "y") {
        "NHS.net Email Address: $mail
Password to NHS and Windows: $Password"
    }
    else { "Password to Windows: $Password" }
}
    
$ref = Read-Host "Enter the reference number of the request"
$task = $ref
$req = Read-Host "Enter the requester's name"
$FirstName = Read-Host "Enter the new user's first name"
$LastName = Read-Host "Enter the new user's last name"
$Name = "$($FirstName).$($LastName)"
$Groups = @("DELG-MCD-G-NSADC_Staff_RDSSrv", "DELG-D-FAS-USR", "G_A001_Print_Users_A-K", "L_A001_APPV_USERS", "rFA-A001AppSenseUsers", "rFA-A001fsrv002-MyDocs-Redirect")
$homeDirectory = "\\BEHCMDDPRAFSS01.BEHMHT.NET\Users$\$Name"
$homeDrive = "H"
$Password = ("!@#$%^&*0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz".tochararray() | Sort-Object { Get-Random })[0..9] -join ''
$Password = Read-Host 'Enter Password'

$Params = @{
    Path                  = 'OU=KnowledgeWorkers,OU=Users,OU=Managed,DC=BEHMHT,DC=net'
    SamAccountName        = $Name
    Description           = $Name
    Name                  = $Name
    GivenName             = $FirstName
    Surname               = $LastName
    DisplayName           = $Name 
    UserPrincipalName     = "$Name@BEHMHT.net"
    EmailAddress          = Email
    AccountPassword       = (ConvertTo-SecureString -AsPlainText "$Password" -Force)
    ChangePasswordAtLogon = $true  
    Enabled               = $true
}

$User = Get-ADUser -LDAPFilter "(sAMAccountName=$Name)"
If ($User -eq $Null) {

    New-ADUser @Params



    Set-ADUser $name -Replace @{info = $task }
    Set-ADUser $name -Replace @{HomeDirectory = $homeDirectory }
    Set-ADUser $name -Replace @{HomeDrive = $homeDrive }

    $mail = Get-ADUser -identity $name -Properties EmailAddress | Select-Object -ExpandProperty EmailAddress

    New-Item –path $homeDirectory -type directory -force

    $acl = Get-Acl $homeDirectory

    $FileSystemRIghts = [System.Security.AccessControl.FileSystemRights]"Modify"
    $AccessControlType = [System.Security.AccessControl.AccessControlType]::Allow

    $InheritanceFlags = [System.Security.AccessControl.InheritanceFlags]"ContainerInherit, ObjectInherit"
    $PropagationFlags = [System.Security.AccessControl.PropagationFlags]"None"

    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule ($Name, $FileSystemRIghts, $InheritanceFlags, $PropagationFlags, $AccessControlType)

    $acl.AddAccessRule($AccessRule)

    Set-Acl -Path $homeDirectory -AclObject $acl -ea Stop

 
    ForEach ($g in $groups) {
        Add-ADGroupMember $g $name
    }

    $Clip = Clip

    Set-Clipboard -Value "Dear $Req,

Please find the new login credentials you requested for below:

Full Name: $FirstName $LastName
Username: $Name
$Clip

Please forward this email to behmhtservicedesk@atos.net if you need to contact us back.

Alternatively, you can provide the information using Online Service Desk Chat (accessed via the Self-Service Portal) or you can call us on internal 25555 / external 0 208 70 25555.

Kind regards, 
Abdellah 

Abdellah Rhouddani | BEH Service Desk
Barnet, Enfield and Haringey Mental Health Trust
Phone: internal 25555 / external 0 208 70 25555
Email: behmhtservicedesk@atos.net" 

    Write-Host "
The user's password is $Password"

}
Else {
    "***User already exists***"
    Get-ADUser $Name -Properties Info | Select-Object Name, Info, Enabled, DistinguishedName
}