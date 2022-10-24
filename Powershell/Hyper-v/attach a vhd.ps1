
$vmname = read-host "Enter a Vm name "

New-VM -Name $VMname -MemoryStartupBytes 1gb  -Generation 2


$GroupBool = Read-Host "Press 1 for Windows Server-2016 VM, Press 2 for Windows-10 Vm, Press 3 For Ubuntu VM."
if ($GroupBool.ToLower() -eq "1"){

        Add-VMHardDiskDrive -VMName $vmname -Path "C:\Exported-VMs\Dev-server16\Virtual Hard Disks\Dev-server16.VHDX"

    if ($GroupBool.ToLower() -eq "2"){
    
        Add-VMHardDiskDrive -VMName $vmname -Path "C:\Exported-VMs\Dev-lab10\Virtual Hard Disks\Dev-lab10.VHDX"
    }
    if ($GroupBool.ToLower() -eq "3"){

        Add-VMHardDiskDrive -VMName $vmname -Path  "C:\Exported-VMs\Ubuntu-Dev\Virtual Hard Disks\Ubuntu-Dev.VHDX"
    }
    if ($GroupBool.ToLower() -eq "4"){

        Add-VMHardDiskDrive -VMName $vmname -Path  
    }

}


Add-VMDvdDrive -VMName $VMname -Path $path3
Set-VMFirmware -VMName $VMname -EnableSecureBoot Off
#set ram and Storge to dynamic and set buffer to 10

Set-VM -Name $VMname -MemoryStartupBytes 1GB -DynamicMemory -MemoryMinimumBytes 512MB -MemoryMaximumBytes 2gb
Set-VMMemory -VMName $VMname -Buffer 10

#add net adapater and smart paging path.
set-vm -Name $VMname -SmartPagingFilePath "C:\Smartpageing"  -AutomaticCheckpointsEnabled $false -CheckpointType Disabled -Confirm:$false
Add-VMNetworkAdapter -VMName $VMname -SwitchName "Default Switch"
Remove-VMSnapshot -VMName $vmname 




