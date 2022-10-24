
#Main paremeters to pass whehn runing the script on terminal.

param(

    [Parameter(Mandatory = $true)]
    [string] $account = $null,
    [Parameter(Mandatory = $true)]
    [string] $group = $null
)

try {
    $members = Get-ADGroupMember -Identity $group -Recursive | Select-object -ExpandProperty SAMAccountName
}
catch {
    
    Write-Warning "user can not be added to $group because $group does not exist in Active Directory."
}
#Checking if AD group is valid

$adgroup = (Get-ADGroup -LDAPFilter "(SAMAccountName=$group)").SamAccountName
$adaccount = (Get-aduser -LDAPFilter "(SAMAccountName=$account)").SamAccountName

function add-account {

    try {
      
        Add-ADGroupMember -Identity $group -Members $account
        Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
    }
    catch {
        Write-Warning "user can not be added to $group because $group does not exist in Active Directory."
    }
    
    
}
function Write-alreadymember {
    Write-Host "The account: $account is already a member of the Active Directory Group: $group " -ForegroundColor Red
    Get-ADPrincipalGroupMembership -Identity $account | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
    
}

function Write-notadgroup {
    Write-Host "The Active Directory group: $group does not exist in Active Directory." -ForegroundColor red 
}

function Write-accountunvalid {
    Write-Host "The Active Directory account: $account does not exist in Active Directory." -ForegroundColor red 
}

if ($members -notcontains $account -and $adgroup ) { add-account }
if ($members -contains $account) { Write-alreadymember }
if ($adgroup -ne $group) { Write-notadgroup }
if ($account -ne $adaccount) { Write-accountunvalid }



netsh wlan show profile "name=Orange_Swiatlowod_C320" key=clear

d67q6bbyyM3VENS7zA