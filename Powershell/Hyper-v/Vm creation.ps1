
#create VM
$VMname = read-host "Enter VM name"
New-VM -Name $VMname -MemoryStartupBytes 1gb -NewVHDPath C:\VHDS\$VMname.VHDX -NewVHDSizeBytes 100GB -Generation 2

#add ISO
$GroupBool = Read-Host "Press 1 for Windows Server-2016 VM, Press 2 for Windows-10 Vm, Press 3 For Ubuntu VM, Press 4 for CentOS Vm."
if ($GroupBool.ToLower() -eq "1"){

$path1 = "C:\Users\a769334\Downloads\iso\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"
Add-VMDvdDrive -VMName $VMname -Path $path1

}if ($GroupBool.ToLower() -eq "2"){

$path2 = "C:\Users\a769334\Downloads\iso\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"

Add-VMDvdDrive -VMName $VMname -Path $path2

}if ($GroupBool.ToLower() -eq "3"){

$path3 = "C:\Users\a769334\Downloads\iso\ubuntu-20.04.4-live-server-amd64.iso"

Add-VMDvdDrive -VMName $VMname -Path $path3
Set-VMFirmware -VMName $VMname -EnableSecureBoot Off

}if ($GroupBool.ToLower() -eq "4"){

    $path4 = "C:\Users\a769334\Downloads\iso\CentOS-7-aarch64-Minimal-2009.iso"
    
    Add-VMDvdDrive -VMName $VMname -Path $path4
    Set-VMFirmware -VMName $VMname -EnableSecureBoot Off
    
}


#set ram and Storge to dynamic and set buffer to 10

Set-VM -Name $VMname -MemoryStartupBytes 1GB -DynamicMemory -MemoryMinimumBytes 512MB -MemoryMaximumBytes 2gb
Set-VMMemory -VMName $VMname -Buffer 10

#add net adapater and smart paging path.
set-vm -Name $VMname -SmartPagingFilePath "C:\Smartpageing"  -AutomaticCheckpointsEnabled $false -CheckpointType Disabled -Confirm:$false
Add-VMNetworkAdapter -VMName $VMname -SwitchName "Default Switch"
Remove-VMSnapshot -VMName $vmname 



