

function new-create-bulk {

    $ADUsers = Import-csv "D:\Atos2LS\A769334 Al\bulk_users.csv"

    #Loop through each row containing user details in the CSV file 
    foreach ($User in $ADUsers) {
	
		
        $Username = $User.username
        $Firstname = $User.firstname
        $Lastname = $User.lastname
        $OU = $User.ou 
        $Password = ("!@#$%^&*0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz".tochararray() | Sort-Object { Get-Random })[0..9] -join ''
        $change = $User.change
        $date = Get-Date
  

        #Check to see if the user already exists in AD
        if (Get-ADUser -F { SamAccountName -eq $Username }) {
            #If user does exist, give a warning
            Write-Warning "A user account with username $Username already exist in Active Directory."
        }
        else {
            #User does not exist then proceed to create the new user account
		
            #Account will be created in the OU provided by the $OU variable read from the CSV file
            New-ADUser `
                -SamAccountName $Username `
                -UserPrincipalName "$Username@domain.local" `
                -Name "$Firstname $Lastname" `
                -GivenName $Firstname `
                -Surname $Lastname `
                -Enabled $True `
                -DisplayName "$Lastname, $Firstname" `
                -Path $OU `
                -AccountPassword (convertto-securestring $Password -AsPlainText -Force) -ChangePasswordAtLogon $True
            Write-host "The Active Directory account $Username is created successfully" -ForegroundColor green
            Set-ADUser $Username -Replace @{info = "Created as per $change on the $date" }
            write-Host "Username: $Username and Password: $password" -ForegroundColor green
       

        }
    }


}