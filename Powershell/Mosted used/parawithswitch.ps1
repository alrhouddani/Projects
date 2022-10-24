function CreateOrRemoveAccount {
    param(
        [Parameter(Mandatory = $true,
            ParameterSetName = 'create')][string] $FirstName,
        [Parameter(Mandatory = $true,
            ParameterSetName = 'create')][string] $LastName,
        [Parameter(Mandatory = $true)][string] $username,
        [Parameter(Mandatory = $true,
            ParameterSetName = 'remove')][string] $change)
        
    switch ($PsCmdlet.ParameterSetName) {
        "create" { Write-Host "create was used" }
        "remove" { Write-Host "remove was used" }
    }
}


