#ms Doc
try {
    $wc = new-object System.Net.WebClient
    $wc.DownloadFile("http://www.contoso.com/MyDoc.doc", "c:\temp\MyDoc.doc")
}
catch [System.Net.WebException], [System.IO.IOException] {
    "Unable to download MyDoc.doc from http://www.contoso.com."
}
catch {
    "An error occurred that could not be resolved."
}

# with terminating error add -ErrorAction Stop or $ErrorActionPreference = 'SilentlyContinue'

try {
    Get-Item -Path nonexistenconfigurationfile -ErrorAction Stop
}
catch [System.Management.Automation.ItemNotFoundException] {

    Write-Host -Object 'ItemNotFoundException' 
}

# with a non terminating error

try {
    Get-Item -Path $null
}
catch [System.Management.Automation.ParameterBindingException] {

    Write-Host -Object 'ParameterBindingException' 
}

Try {
    Get-ADGroup -Identity $GroupName
    Add-ADGroupMember -Identity $GroupName -Members $ListOfUserSamAccountNames
}
Catch {
    Write-Warning "Users could not be added to $GroupName because $GroupName
    does not exist in Active Directory."
}