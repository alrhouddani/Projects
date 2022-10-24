param(

    [parameter(mandatory)] [string] $vmname,
    [parameter(mandatory)] [string] $action 
   
)


Set-Location -Path 'C:\Program Files (x86)\VMware\VMware Workstation'


if ($action -eq 'start') {
    switch ( $vmname ) {

        'tower' {
            ./vmrun -T ws start "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Red Hat Enterprise Linux 8 64-bit\Red Hat Enterprise Linux 8 64-bit.vmx" nogui
            Write-Host "ansible-tower vm is on " -ForegroundColor green
        }
        'ubuntu' {
            ./vmrun -T ws start  "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Ubuntu Server\Ubuntu Server.vmx" nogui
            Write-Host "ubuntu server vm is on" -ForegroundColor green
        }
        'windows' {
            ./vmrun -T ws start "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Windows-Server19\Windows-Server19.vmx" nogui
            Write-Host "windows server vm is on " -ForegroundColor green
        }
        'redhat' {
            ./vmrun -T ws start  "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Red Hat server\Red Hat server.vmx" nogui
            Write-Host "redhat server vm is on" -ForegroundColor green
        }
        'all' {
            ./vmrun -T ws start  "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Windows-Server19\Windows-Server19.vmx" nogui
            ./vmrun -T ws start  "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Ubuntu Server\Ubuntu Server.vmx" nogui
            ./vmrun -T ws start "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Red Hat server\Red Hat server.vmx" nogui
            ./vmrun -T ws start "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Red Hat Enterprise Linux 8 64-bit\Red Hat Enterprise Linux 8 64-bit.vmx"  nogui
            Write-Host "all vms are on" -ForegroundColor green
        }


    }



}

if ($action -eq 'stop') {
    
    switch ( $vmname ) {

        'tower' {
            ./vmrun stop "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Red Hat Enterprise Linux 8 64-bit\Red Hat Enterprise Linux 8 64-bit.vmx" 
            Write-Host "ansible-tower vm is off" -ForegroundColor red
        }
        'ubuntu' {
            ./vmrun stop "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Ubuntu Server\Ubuntu Server.vmx" 
            Write-Host "ubuntu server vm is off" -ForegroundColor red
        }
        'windows' {
            ./vmrun stop "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Windows-Server19\Windows-Server19.vmx"
            Write-Host "windows server vm is off" -ForegroundColor red
        }
        'redhat' {
            ./vmrun stop "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Red Hat server\Red Hat server.vmx" 
            Write-Host "redhat server vm is off" -ForegroundColor red
        }
        'all' {
            ./vmrun stop "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Windows-Server19\Windows-Server19.vmx"
            ./vmrun stop "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Ubuntu Server\Ubuntu Server.vmx"
            ./vmrun stop "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Red Hat server\Red Hat server.vmx"
            ./vmrun stop "C:\Users\a769334\OneDrive - Atos\Documents\Virtual Machines\Red Hat Enterprise Linux 8 64-bit\Red Hat Enterprise Linux 8 64-bit.vmx" 
            Write-Host "all vms are off" -ForegroundColor red
        }


    }


}

