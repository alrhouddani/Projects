

$GroupBool = Read-Host "Press 1 for Windows Server-2016 VM, Press 2 for Windows-10 Vm, Press 3 For Ubuntu VM."
if ($GroupBool.ToLower() -eq "1"){

       Import-VM -Path "C:\Exported-VMs\Dev-server16\Virtual Machines\B5A3FA6A-E38C-4A08-B037-383AA7F5E00C.vmcx" -Copy -GenerateNewId

    if ($GroupBool.ToLower() -eq "2"){
    
        Import-VM -Path "C:\Exported-VMs\Dev-lab10\Virtual Machines\4D235566-2E48-450E-A1D1-63F027F384F7.vmcx" -Copy -GenerateNewId
    }
    if ($GroupBool.ToLower() -eq "3"){

        Import-VM -Path "C:\Exported-VMs\Ubuntu-Dev\Virtual Machines\7F27523F-CFF9-49CF-AD14-F5C622FDAEE4.vmcx" -Copy -GenerateNewId

    }

}

