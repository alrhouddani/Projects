import subprocess

option = input("Enter Vm name: ")
action = input("Enter action needed: ")


if action == "start":
    if option == "redhat":
        subprocess.run('C: \\Program Files(x86)\VMware\\VMware Workstation\\vmrun.exe" -T ws start  "C: \\Users\\a769334\OneDrive - Atos\\Documents\\Virtual Machines\\Red Hat server\\Red Hat server.vmx" nogui')
    if option == "windows":
        subprocess.run('C:\\Program Files (x86)\VMware\\VMware Workstation\\vmrun.exe" -T ws start "C:\\Users\a769334\OneDrive - Atos\\Documents\\Virtual Machines\\Windows-Server19\\Windows-Server19.vmx" nogui')
    if option == "tower":
        subprocess.run(
            '"C:\\Program Files (x86)\VMware\\VMware Workstation\\vmrun.exe" -T ws start "C:\\Users\\a769334\OneDrive - Atos\\Documents\Virtual Machines\\Red Hat Enterprise Linux 8 64-bit\\Red Hat Enterprise Linux 8 64-bit.vmx" nogui', shell=True)
    if option == "ubuntu":
        subprocess.run(
            '"C:\\Program Files (x86)\VMware\\VMware Workstation\\vmrun.exe" -T ws start "C:\\Users\\a769334\OneDrive - Atos\\Documents\\Virtual Machines\\Ubuntu Server\\Ubuntu Server.vmx" nogui', shell=True)
