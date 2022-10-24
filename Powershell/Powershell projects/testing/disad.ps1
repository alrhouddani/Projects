

function disable-account {
    
    $users = $user


    foreach ($username in $users) {


        $adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$username)").SamAccountName 
        try {
            $disabled = (get-aduser -Identity $username -properties Enabled).Enabled
        }
        catch {
            {}
        }

        if ($disabled -eq $false -and $adaccount -eq $username) {
            Write-Warning "$username the Active Directory account is already disabled"
        
        }
    
        try {
            $ADGroups = Get-ADPrincipalGroupMembership -Identity  $username | Where-Object { $_.Name -ne “Domain Users” }
            Remove-ADPrincipalGroupMembership -Identity  $username -MemberOf $ADGroups -Confirm:$false -verbose 
            Write-host "$username is Removed from all groups Except the Default" -fore green
        }
        catch {

            if ($adaccount -eq $username) { Write-Warning "the $username is not added to any Active Directory groups" }
        }

        if ($username -ne $adaccount) { Write-Host "The Active Directory user: $username does not exist in Active Directory." -ForegroundColor red }

        if ($disabled -eq $true -and $username -eq $adaccount) { 
            $user = Get-ADUser $username -ErrorAction SilentlyContinue
            Disable-ADAccount $user
            Move-ADObject $user -TargetPath 'OU=Disabled Objects,OU=Admin,DC=Domain1,DC=Local'
            Write-host "$username the Active Directory account is disabled successfully" -ForegroundColor Green
            Set-ADUser -Identity $username -Description "Disabled as per $change on the $date"

        }

    }
}


[Parameter(Mandatory,
    ParameterSetName = 'Name',
    Position = 0)]


[Parameter(Mandatory = $true,
    ParameterSetName = 'create')][string] $change = $null, # number of the change requst number


(DefaultParameterSetName = 'Name')]
param (
    [Parameter(Mandatory,
        ParameterSetName = 'Name',
        Position = 0)]
    [string[]]$Name,

    [Parameter(Mandatory,
        ParameterSetName = 'Module')]
    [string[]]$Module,

    [string]$Path
)
$PSCmdlet.ParameterSetName
}