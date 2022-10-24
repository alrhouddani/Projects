#Adding the service account to the Ad Group

$members = Get-ADGroupMember -Identity $Group -Recursive | Select-object -ExpandProperty SAMAccountName

if ($members -contains $srv_account) {

    Write-Host 'The user you are trying to create already Exists' -ForegroundColor Red

}
else {
    Add-ADGroupMember -Identity $Group -Members $srv_account

}
