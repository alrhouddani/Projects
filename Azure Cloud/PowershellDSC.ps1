Configuration WebServerConfiguration
{  
  Node "localhost"
  {        

   Localconfigurationmanager {
  Configurationmode = "applyandautocorrect"
  Configurationmodefrequencymins = 15
  refreshmode = "Push"
  }
    WindowsFeature IIS
    {
      Name = "Web-Server"
      Ensure = "Present"
    }

    WindowsFeature ManagementTools
    {
      Name = "Web-Mgmt-Tools"
      Ensure = "Present"
      Dependson = @('[WindowsFeature]IIS')
    }

    WindowsFeature DefaultDoc
    {
      Name = "Web-Default-Doc"
      Ensure = "Present"
    }
  }
}

WebServerConfiguration -OutputPath "C:\dsc"

Start-DscConfiguration -Wait -Verbose -Path "C:\dsc"


Test-DscConfiguration -Detailed

Remove-WindowsFeature -Name IIS -IncludeManagementTools 
Get-DscLocalConfigurationManager
get-dsclocalconfigurationstatues
Set-DscLocalConfigurationManager -Path "C:\dsc" -Force