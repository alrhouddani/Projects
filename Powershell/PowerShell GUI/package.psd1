@{
    Root = 'c:\Users\a769334\OneDrive - Atos\Desktop\Courses\VsCode\PowerShell GUI\GUI ep3.ps1'
    OutputPath = 'c:\Users\a769334\OneDrive - Atos\Desktop\Courses\VsCode\out'
    Package = @{
        Enabled = $true
        Obfuscate = $false
        HideConsoleWindow = $false
        DotNetVersion = 'v4.6.2'
        FileVersion = '1.0.0'
        FileDescription = ''
        ProductName = ''
        ProductVersion = ''
        Copyright = ''
        RequireElevation = $false
        ApplicationIconPath = ''
        PackageType = 'Console'
    }
    Bundle = @{
        Enabled = $true
        Modules = $true
        # IgnoredModules = @()
    }
}
        