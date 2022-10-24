param(
    [Parameter(Mandatory = $true)][string] $username,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'rename')][string] $newusername,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'password')][string] $password,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'newOU')][string] $newOU,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'Azure')][string] $Azure_Sync)

Import-Module ActiveDirectory
try {

    $User = (Get-aduser -LDAPFilter "(SAMAccountName=$username)").SamAccountName
}
catch {

    Write-Host "Exception String: $($_.Exception.Message)"
    Write-Warning "The user $user can not be modified because $firstname.$lastname already exist in Active Directory"
}

if ($user -eq $username) {
    switch ($PsCmdlet.ParameterSetName) {
        "rename" { Rename-ADObject -Identity $username -NewName $newusername }

        "password" { Set-ADAccountPassword -Identity $username -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$password" -Force) }
        
        "Azure" { 

            Import-Module ADSync
            Start-ADSyncSyncCycle -PolicyType Delta
        }

        "newOU" {
        
            ForEach ($user in $user) { 
                $user = Get-ADUser $username
                Move-ADObject $user -TargetPath $newOU
                get-aduser -Identity $username | Select-Object SamAccountName, Enabled, DistinguishedName | Format-Table -AutoSize
            } 
            
        }
    }
}
else {

    Write-Warning "The user $user can not be created because $firstname.$lastname already exist in Active Directory"
}