#images
docker pull mcr.microsoft.com/windows/servercore:ltsc2019
docker pull mcr.microsoft.com/windows/nanoserver:ltsc2019
#docker switch to win or lin
& $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchDaemon
# nano container
docker run -it --name nanoserver -v C:\Temp\azure-dev:/nanoserver alrh/mynano
docker pull mcr.microsoft.com/windows/servercore:ltsc2022
#nano 
docker run -it --name nanoserver -v C:\Temp\azure-dev:/nanoserver mcr.microsoft.com/powershell:preview-nanoserver-1803 pwsh.exe 


