import subprocess


def start(cmd, shell):
    subprocess.run(cmd, shell=True)


start(run='"C:\\Program Files (x86)\VMware\\VMware Workstation\\vmrun.exe" -T ws start "C:\\Users\\a769334\OneDrive - Atos\\Documents\\Virtual Machines\\Ubuntu Server\\Ubuntu Server.vmx" nogui')
