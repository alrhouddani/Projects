import subprocess

subprocess.run('C: \\Program Files(x86)\\VMware\\VMware Workstation\\vmrun.exe" -T ws start  "C: \\Users\\a769334\OneDrive - Atos\\Documents\\Virtual Machines\\Red Hat server\\Red Hat server.vmx" nogui')

subprocess.run('C:\\Program Files (x86)\\VMware\\VMware Workstation\\vmrun.exe" -T ws start "C:\\Users\a769334\OneDrive - Atos\\Documents\\Virtual Machines\\Windows-Server19\\Windows-Server19.vmx" nogui')

subprocess.run(
    '"C:\\Program Files (x86)\\VMware\\VMware Workstation\\vmrun.exe" -T ws start "C:\\Users\\a769334\OneDrive - Atos\\Documents\Virtual Machines\\Red Hat Enterprise Linux 8 64-bit\\Red Hat Enterprise Linux 8 64-bit.vmx" nogui', shell=True)
subprocess.run(

    '"C:\\Program Files (x86)\VMware\\VMware Workstation\\vmrun.exe" -T ws start "C:\\Users\\a769334\OneDrive - Atos\\Documents\\Virtual Machines\\Ubuntu Server\\Ubuntu Server.vmx" nogui', shell=True)
