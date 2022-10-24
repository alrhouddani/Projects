

param(

    [Parameter(Mandatory)] [string] $ip_adress = $null,
    [Parameter(Mandatory)] [string] $ports = $null,
    [Parameter(Mandatory)] [string] $Webhook = $null,
    [Parameter(Mandatory)] [string] $ResourceGroupName = $null,
    [Parameter(Mandatory)] [string] $VirtualMachine = $null
)


# Get Azure Run As Connection Name
$connectionName = "AzureRunAsConnection"
try {
    $servicePrincipalConnection = Get-AutomationConnection -Name $connectionName
    # Logging in to Azure AD with Service Principal
    "Logging in to Azure AD…"
    Connect-AzureAD –TenantId $servicePrincipalConnection.TenantId `
        -ApplicationId $servicePrincipalConnection.ApplicationId `
        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint
}
catch {
    if ($servicePrincipalConnection) {
        $ErrorMessage = "Connection $connectionname Not found."
        throw $ErrorMessage
    }
    else {
        Write-Error -Message $_.Exception
        throw $_.Exception
    }
}

try {
    Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VirtualMachine              
}
catch {
    { $Message = "The Virtual Machine is Not found."
        throw $Message }
}

Invoke-AzVMRunCommand -ResourceGroupName $ResourceGroupName -Name $VirtualMachine -com
function New-Webhook {
      
}
function Hide-ShutDown {

    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Start\HideShutDown" -Name "value" -Value 1
}

function New-Rule {
    New-NetFirewallRule -DisplayName -LocalPort $Ports -Direction Inbound -Action Allow -RemoteAddress $ip_adress
}

############################
#         Main
############################

#calling all funcations 
Hide-ShutDown
New-Rule
New-Webhook