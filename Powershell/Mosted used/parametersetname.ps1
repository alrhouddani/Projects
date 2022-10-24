function parametersetname {
    param (
        [Parameter(Mandatory = $true,
            ParameterSetName = 'server')][string] $computername,
        [Parameter(Mandatory = $true,
            ParameterSetName = 'user')][string] $user,
        [Parameter(Mandatory = $true,
            ParameterSetName = 'user')][string] $userlastname

    )
  
}

switch (options) {

    "$computername" { Write-Host "$computername" }
    "$user" { Write-Host "$user" }

}