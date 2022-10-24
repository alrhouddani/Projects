function CreateOrRemoveAccount {
    param (
        [Parameter(Mandatory = $true,
            ParameterSetName = 'create')][string] $FirstName,
        [Parameter(Mandatory = $true,
            ParameterSetName = 'create')][string] $LastName,
        [Parameter(Mandatory = $true,
            ParameterSetName = 'create')][string] $username,
        [Parameter(Mandatory = $true,
            ParameterSetName = 'remove')][string] $user,
        [Parameter(Mandatory = $true,
            ParameterSetName = 'remove')][string] $change
    )
    if ($FirstName -and $LastName -and $username) { 
        Write-Host "creating account"
    }
    if ($user -and $change) {
        Write-Host "removeing account "
    }
    
    
}

