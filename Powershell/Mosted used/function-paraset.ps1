function test {
    param (
        [Parameter(Mandatory = $true,
            ParameterSetName = 'server')][string] $computername,
        [Parameter(Mandatory = $true,
            ParameterSetName = 'user')][string] $user,
        [Parameter(Mandatory = $true,
            ParameterSetName = 'user')][string] $userlastname,
        [Parameter(Mandatory = $false)][switch]$summary
    )
    if ($computername) { 
        Write-Host "$computername"
    }
    if ($user) {
        Write-Host "$user"
    }
    
    
}

test -computername server01
test -user all -userlastname rhouddani

