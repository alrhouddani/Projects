param(

    [Parameter(Mandatory = $true)] [string] $account = $null,
    [Parameter(Mandatory = $true)] [string] $group = $null,
    [Parameter(Mandatory = $true)] [switch] $Add,
    [Parameter(Mandatory = $true)] [switch] $remove
)

if ($add.IsPresent) {

    Write-Host "add was used" -ForegroundColor green

} if ($remove.IsPresent) {

    Write-Host "remove was" -ForegroundColor red
}

##########################33


if ($type -eq 'atos-admin') { $ou = 'OU=Atos Admin accounts,DC=dev,DC=com' }
if ($type -eq '2line-support') { $ou = 'OU=BEH accounts,DC=dev,DC=com' }
if ($type -eq 'beh-account') { $ou = 'OU=2nd line support engineers,DC=dev,DC=com' }
if ($null -eq $type) { Continue }


switch ($type) {
    'atos-admin' { $ou = 'OU=Atos Admin accounts,DC=dev,DC=com' }
    '2line-support' { $ou = 'OU=BEH accounts,DC=dev,DC=com' }
    'beh-account' { $ou = 'OU=2nd line support engineers,DC=dev,DC=com' }
}