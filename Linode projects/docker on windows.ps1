

#Enable containers only needed if you are runing windows containers 

remove-WindowsOptionalFeature -Online -FeatureName containers -All


#Enable Microsoft-Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

#Enable Microsoft-Windows-Subsystem-Linux (WSL)

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux