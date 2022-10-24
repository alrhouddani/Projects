$GroupBool = Read-Host "Is the user an Author? If not, Secretary role will be applied. Y/N"
if ($GroupBool.ToLower() -eq "y") {

    Add-ADGroupMember a001_digidict_authors $user

}
else {

    Add-ADGroupMember a001_digidict_secretaries $user

}