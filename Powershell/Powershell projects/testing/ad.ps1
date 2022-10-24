if ($args.Count -eq 0) {
    Get-Help $MyInvocation.MyCommand.Definition
    return
}

Import-Module ADDSDeployment
Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "WinThreshold" `
    -DomainName "Domain1.Local" `
    -DomainNetbiosName "DOMAIN1" `
    -ForestMode "WinThreshold" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true



$PSDefaultParameterValues = @{
    "Send-MailMessage:SmtpServer" = "Server123"
}

$hash = @{Name = "brian"; Age = "23"; Location = "UK" }