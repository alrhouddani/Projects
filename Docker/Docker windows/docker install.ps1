ssh alrh@Dev-Windows10
set-executionpolicy unrestricted
# set VirtualizationE
$name = read-host "VM name"
Set-VMProcessor -VMName $name -ExposeVirtualizationExtensions $true
start-vm -name $name
#adding docker provider
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name DockerMsftProvider -repository PSGallery -Force
#installing docker 
Install-Package -Name docker -ProviderName DockerMsftProvider -Force

#enable container & Microsoft-Hyper-V Features 

Enable-WindowsOptionalFeature -Online -FeatureName containers -All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False
wsl --set-default-version 2

#downloading disto Ubuntu.appx
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
Add-AppxPackage .\Ubuntu.appx

wsl --terminate docker-desktop
wsl --unregister docker-desktop
wsl --terminate docker-desktop-data
#docker switch to win or lin

& $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchDaemon
