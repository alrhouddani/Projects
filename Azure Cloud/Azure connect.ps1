Import-Module -Name Powershellget -Force
Install-Module -Name az -AllowClobber
 
 abdellahrhouddani@hotmail.com
 #Connect to Azure
 
 Connect-AzAccount -Tenant 804a7308-6dbd-480f-8b5a-2eaf83182009
  #Connect to Azure AD
 Connect-AzureAD -TenantId "abdellahrhouddanihotmail.onmicrosoft.com"
 
 $Pas = New-Object -TypeName microsoft.open.azuread.model.passwordprofile
 $pas.Password = "Kilokoli@2123"

New-AzureADUser -AccountEnabled $true -PasswordProfile $Pas -DisplayName "House" -UserPrincipalName "Dr.House@abdellahrhouddanihotmail.onmicrosoft.com" -MailNickName "Drhouse"
Get-AzureADUser -Filter "UserType eq 'Member'"
Get-AzureADUser | Select-Object DisplayName, ObjectId

New-AzureADGroup -DisplayName "Free03p" -MailEnabled $false -SecurityEnabled $true -MailNickName "NotSet"
get-AzureADGroup | Select-Object DisplayName, ObjectId
Add-AzureADGroupMember -ObjectId "dae613f0-0e55-4901-80b0-86dc6ac2a4f9" -RefObjectId "7d93b224-3413-4db2-9345-b5971baf7952"

Get-AzureADGroupMember -ObjectId "dae613f0-0e55-4901-80b0-86dc6ac2a4f9"
Get-AzureADGroup | Select-Object  ObjectId, DisplayName
Get-AzureADMSAdministrativeUnit
Get-AzureADMSAdministrativeUnitMember -Id 99257afe-c316-4ea3-b6a6-aa158b6b6636  -All $true

Add-AzureADMSAdministrativeUnitMember -Id "99257afe-c316-4ea3-b6a6-aa158b6b6636" -RefObjectId "ae6212fa-0e3d-4663a2ee-71c7947f3705"
New-AzureADMSAdministrativeUnit -DisplayName "Main Admins" -Description "Admin all"
Set-AzureADMSAdministrativeUnit -Id 12c2aa4a-6417-4553-817b-8c9a80d5c7ef

New-AzureRmResourceGroup -Name FreeGroup1 -Location 'Germany West Central'
New-AzResourceLock
New-AzureRmAct

Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
Get-AzResourceLock
New-AzResourceLock -LockName "Do not Delete" -LockLevel CanNotDelete -LockNotes "No Delete" -ResourceGroupName ubuntu -Force
New-AzResourceLock -LockName "Do not Delete" -LockLevel CanNotDelete -LockNotes "No Delete" -ResourceName FreeWebapp01 -ResourceType Microsoft.Web/sites -ResourceGroupName FreeGroup
Remove-AzResourceLock -LockName "Do not Delete" -ResourceName FreeWebapp01 -ResourceType Microsoft.Web/sites -ResourceGroupName FreeGroup
Get-AzResourceLock | Select-Object ResourceGroupName, name, Properties

cleaz provider list --output table
Get-AzResourceProvider | Select-Object ProviderNamespace
Get-AzResource | Select-Object ResourceId
New-AzResourceGroup -Name Freepwsh -Location 'Germany West Central'
az group create -l germanywestcentral -n Freecli1

get-AzResourceGroup | Select-Object ResourceGroupName, ResourceId

Set-AzResourceLock -LockName "No delete" -LockLevel CanNotDelete -LockNotes "Do Not delete"  -ResourceGroupName "Freepwsh"
az lock create --name Nodelete --resource-group FreeCLI --lock-type CannotDelete

Get-AzResourceLock | Select-Object ResourceGroupName, Name, LockId
$locks = (Get-AzResourceLock -ResourceGroupName Freepwsh).lockid
Remove-AzResourceLock -LockId $locks

Remove-AzResourceGroup -Name Freecli1 -Force -Confirm:$false
Get-AzResource -ResourceGroupName ubuntu | Select-Object Name, ResourceId
#move resources to a other resource fgroup
$r1 = Get-AzResource -Name ASP-FreeGroup-95dc -ResourceGroupName ubuntu
$r2 = Get-AzResource -Name FreeWebapp01 -ResourceGroupName ubuntu
Move-AzResource -DestinationResourceGroupName Freepwsh -ResourceId $r1.ResourceId, $r2.ResourceId -Force -Confirm: $false

#Appying tags
Set-AzResourceGroup -Name Freepwsh -tag @{ project= "Free";managedby="AbdellahRhouddani"}

$r = Get-AzResourceGroup -Name Freepwsh
Get-AzResource -ResourceGroupName $r.ResourceGroupName | ForEach-Object {Set-AzResource -ResourceId $_.ResourceId -Tag $r.Tags -Force}

#managmenet group
New-AzManagementGroup -GroupName 'FreeMG01'
Get-AzManagementGroup | Select-Object Name, Id

#Create a storge account
$resourceGroup = "resource-group"
$location = "location"
New-AzResourceGroup -Name $resourceGroup -Location $location

Get-AzLocation | Select-Object Location, DisplayName | Where-Object DisplayName -CMatch "Germany*"
#Create a storge
New-AzStorageAccount -ResourceGroupName Free -Name "azcopy022" -Location germanywestcentral -Kind StorageV2 -AccessTier Hot -SkuName Standard_LRS
New-AzStorageAccount -ResourceGroupName Free -Name "freestorge01" -Location germanywestcentral -Kind -AccessTier Hot -SkuName Standard_LRS
Remove-AzStorageAccount -ResourceGroupName Free -Name "freestorge" -Force -Confirm: $false
Get-AzStorageAccount | Select-Object StorageAccountName, ResourceGroupName, PrimaryLocation, Kind

#Creating a file share
New-AzRmStorageShare -ResourceGroupName free -StorageAccountName freestorge01 -AccessTier Cool -Name azuretest01 -EnabledProtocol SMB -QuotaGiB 5120

Get-AzRmStorageShare -ResourceGroupName free -StorageAccountName freestorge01

Remove-AzRmStorageShare -ResourceGroupName free -StorageAccountName freestorge01 -Name azuretest -Force -Confirm: $false

#Creating a container
Get-AzRmStorageContainer -ResourceGroupName free -StorageAccountName freestorge 
New-AzRmStorageContainer -ResourceGroupName free -StorageAccountName  freestorge -Name azuretest01 -PublicAccess Container -Confirm: $false
Remove-AzRmStorageContainer -ResourceGroupName free -StorageAccountName  freestorge -Name azuretest01 -Force -Confirm: $false
Register-AzResourceProvider -ProviderNamespace Microsoft.Cdn
get-AzResourceProvider | Select-Object ProviderNamespace
#create a Azure Recovery Services Vault
New-AzRecoveryServicesVault
New-AzRecoveryServicesVault -Name voult01 -ResourceGroupName Free -Location 'Germany West Central' -Confirm: $false
Get-AzRecoveryServicesVault | Select-Object Name, Location, ResourceGroupName

#creating VM

New-AzVM -ResourceGroupName Free -Name azps -Location 'Germany West Central' -Image Win2016Datacenter -Size "standard_B1s" -OpenPorts 3389
az vm create --name vmcli --resource-group 'free01'  --location "germanywestcentral"  --image win2016datecenter --size "standard_B1s" --admin-username cliadmin --admin-password Kilokoli@123
Set-AzVM -ResourceGroupName Free -Name azps -

Stop-AzVM -Name azps -Force
get-azvm -ResourceGroupName Free
Set-AzVM -Redeploy -ResourceGroupName "myResourceGroup" -Name "myVM"

Get-AzTenant
new-azresourceGroup -name Free -location "germanywestcentral"


New-AzResourceGroupDeployment -name webapp00229 -ResourceGroupName free -TemplateUri "https://raw.githubusercontent.com/azurealrh/azure111/main/Newwbapp.json"
get-AzResourceGroup 
$rg = 'Vcodetesting'
New-AzResourceGroup -name $rg -location germanywestcentral -Force

New-AzResourceGroupDeployment -name vcodevmtestting -ResourceGroupName Vcodetesting -TemplateUri 'https://raw.githubusercontent.com/azurealrh/azure111/main/Vmjson.json'

    
New-AzResourceGroupDeployment -name webvcode -ResourceGroupName Vcodetesting -TemplateFile "C:\Users\a769334\OneDrive - Atos\Desktop\VsCode\Azure\Jsontemp\webapp01.json"

New-AzResourceGroupDeployment -name vcsode484803d -ResourceGroupName Vcodetesting -TemplateFile "C:\Users\a769334\OneDrive - Atos\Desktop\VsCode\Azure\Jsontemp\webapp01.json" 

New-AzResourceGroupDeployment -name vscodetestingnetwork -ResourceGroupName Vcodetesting -TemplateFile "C:\Users\a769334\OneDrive - Atos\Desktop\VsCode\Azure\Jsontemp\vm01.json"
Stop-AzVM -name vmtesting01 -ResourceGroupName Vcodetesting

Get-AzNetworkInterface | Select-Object Name, Id
add-AzVMNetworkInterface -name "vmtesting01" -Id "/subscriptions/a6cab1fe-4878-4b88-b438-c84987d1a910/resourceGroups/Vcodetesting/providers/Microsoft.Network/networkInterfaces/testingnewnic"
$VirtualMachine = Get-AzVM -ResourceGroupName "Vcodetesting" -Name "vmtesting01"
Add-AzVMNetworkInterface -VM $VirtualMachine -Id "/subscriptions/a6cab1fe-4878-4b88-b438-c84987d1a910/resourceGroups/Vcodetesting/providers/Microsoft.Network/networkInterfaces/testingnewnic"
Update-AzVM -ResourceGroupName "Vcodetesting" -VM $VirtualMachine

az vm extension set 
az vm extension set  
new-azresourceGroup -name "free" -location germanywestcentral -Force 
New-AzVM -name Windows10vm -ResourceGroupName free --admin-username "alrh" --admin-password "Kilokoli@123"
az vm --resource-group free --admin-username "alrh" --admin-password "Kilokoli@123" --name Windows10vm --size 
Add-AzVMDataDisk -VM "Windows10vm" -Name portaltest -CreateOption Attach


Move-AzResource -DestinationResourceGroupName move11 -ResourceId "/subscriptions/a6cab1fe-4878-4b88-b438-c84987d1a910/resourceGroups/FREE11/providers/Microsoft.Compute/virtualMachines/vm01" -

Get-AzVMSize -ResourceGroupName vm_group -VMName automatevm 
get-azvm 
Update-AzVM -VMNAME "automatevm" -Size "Standard_B1ms" -ResourceGroupName "vm_group"

az vm resize --resource-group vm_group --name automatevm --size Standard_B1ms

#dsc

Publish-AzVMDscConfiguration -ResourceGroupName Free -StorageAccountName dscstorge "C:\Users\a769334\OneDrive - Atos\Desktop\VsCode\Azure\Helloworld.ps1" -Force
Set-AzVMDscExtension -Version "2.80" -ResourceGroupName Free -VMName vm -ArchiveResourceGroupName Free -ArchiveBlobName Helloworld.ps1.zip`
-ArchiveStorageAccountName "dscstorge" `
-AutoUpdate -ConfigurationName "Helloworld"
$resourceGroup = 'vm_group'
$vmName = 'VM'
$storageName = 'vmgroupdiag949'
#Publish the configuration script to user storage
#Publish-AzVMDscConfiguration -ConfigurationPath .\iisInstall.ps1 -ResourceGroupName $resourceGroup -StorageAccountName $storageName -force
#Set the VM to run the DSC configuration
Set-AzVMDscExtension -Version '2.80' -ResourceGroupName $resourceGroup -VMName $vmName -ArchiveStorageAccountName $storageName -ArchiveBlobName 'Helloworld.ps1.zip' -ConfigurationName 'Helloworld' -AutoUpdate
Install-Module Az-StorageSync
Invoke-AzStorageSyncCompatibilityCheck -Path C:\Azcopy
Connect-AzAccount
get-AzResourceGroup | Select-Object ResourceGroupName, ResourceId
New-AzResourceGroupDeployment -Name vm01 -ResourceGroupName Network -TemplateFile "C:\Users\a769334\OneDrive - Atos\Desktop\VsCode\Azure\vm.json"
 ssh alrh@172.22.66.207

 new-azresourceGroup -name "Jabob" -location germanywestcentral -Force 