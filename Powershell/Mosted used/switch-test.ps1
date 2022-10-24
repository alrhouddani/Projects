param(
   
    [Parameter(Mandatory)] [string] $name = $null,
    [Parameter(Mandatory)] [string] $option
) 

switch ( $option ) {

    'Service' { Get-Service -Name $name }
    'childitem' { get-childitem -Path $name }

}

#Get-Service -Name Netlogon
#get-childitem -Name C:\VsCode\Ansible