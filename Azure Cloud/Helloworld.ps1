Configuration Helloworld {
    #import module
    Import-Module -modulename PSDesiredStateConfiguration
    Node "localhost" {
        File Helloworld {
            DestinationPath = "c:/temp/Helloworld.txt"
            Ensure = "Present"
            Contents = "Hello world from DSC!!"

        }
    }
   

}
New-Item -Path "c:\" -Name "dsc" -ItemType "directory"
Helloworld -OutputPath "C:\dsc"

Start-DscConfiguration -Wait -Verbose -Path "C:\dsc"
Set-DscLocalConfigurationManager -Path "C:\dsc" -Force
New-Item -Path "c:\" -Name "logfiles" -ItemType "directory"

Get-DscLocalConfigurationManager
get-dsclocalconfigurationstatues
