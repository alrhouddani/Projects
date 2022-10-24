param([switch] $help )
#
# Author: Abdellah Rhouddani
# Date: 2022-06-18
# Version: 4.0
#
if ($help) {
    write-host "This is help for this program. It does nothing. Hope that helps."
}
else {
    write-host "Do nothing."
}
<#To summarize, the regular help with no parameters only shows this data:

.Name
.Syntax
.Aliases
.Remarks
.The Detailed parameter has:

.Name
.Synopsis
.Syntax
.Description
.Parameters
.Examples
.Remarks
#>
#------------------------------------
<#
.Name
add_remove_account_to_group.ps1
.DESCRIPTION
Add an Active Directory object or objects to an Group or ad Groups. Works for both single and bulk operations.
Input parametrs for cli:
Account Use an Active Directory username(SamAccountName)
Accounts use a list of SamAccountNames in a txt file
computer Use an Active Directory computername (hostname)
computers use a list of hostnames in a txt file
adobject use a computername or a username 
Group use an Active Directory group or  a list of ad groups in a txt file
Option add remove add-bulk or remve-bulk
object user computer or group
.SYNOPSIS
To Add a user: run: .\add_remove_account_to_group.ps1 -account username -group landscape_adgroup -change "change requst number" -option Add
To remove a user: run: .\add_remove_account_to_group.ps1 -account username -group landscape_adgroup -change "change requst number" -option remove
To Add a computer: run: .\add_remove_account_to_group.ps1 -computer server -group landscape_adgroup -change "change requst number" -option Add
To remove a computer: run: .\add_remove_account_to_group..ps1 -computer server -group landscape_adgroup -change "change requst number" -option remove
To add bulk users: run .\add_remove_account_to_group.ps1 -accounts Txt file path -group landscape_adgroup -change "change requst number" -option bulk-add
To remove bulk users: run .\add_remove_account_to_group.ps1 accounts Txt file path -group landscape_adgroup -change "change requst number" -option bulk-remove
To add bulk computers: run .\add_remove_account_to_group.ps1 -computers Txt file path -group landscape_adgroup -change "change requst number" -option bulk-remove
To add bulk groups to a user: run .\add_remove_account_to_group.ps1 user username -group Txt file path -change "change requst number" -option bulk-remove
To add bulk groups to a computers: run .\add_remove_account_to_group..ps1 -computers Txt file path -group landscape_adgroup -change "change requst number" -option bulk-remove
.EXAMPLE
.\add_remove_account_to_group.ps1 -account username -group landscape_adgroup -change "change requst number" -option Add
.\add_remove_account_to_group.ps1 -account username -group landscape_adgroup -change "change requst number" -option remove
.\add_remove_account_to_group.ps1 -computer server -group landscape_adgroup -change "change requst number" -option Add
.\add_remove_account_to_group..ps1 -computer server -group landscape_adgroup -change "change requst number" -option remove
.\add_remove_account_to_group.ps1 -accounts Txt file path -group landscape_adgroup -change "change requst number" -option bulk-add
.\add_remove_account_to_group.ps1 accounts Txt file path -group landscape_adgroup -change "change requst number" -option bulk-remove
.\add_remove_account_to_group.ps1 -computers Txt file path -group landscape_adgroup -change "change requst number" -option bulk-remove
.\add_remove_account_to_group.ps1 user username -group Txt file path -change "change requst number" -option bulk-remove
.\add_remove_account_to_group..ps1 -computers Txt file path -group landscape_adgroup -change "change requst number" -option bulk-remove

#>



<#
.DESCRIPTION
Modifying  Active Directory attributes for users
Input parametrs for cli:
account: the ad user's SAMAccountName
option: based on the requst pick the switch needed
SPN:ServicePrincipalNames 
newOU: new OrganizationalUnit 
newfirstname: the new first name 
newlastname: the new first name 
newDisplayName: new DisplayName
TelephoneNumber: TelephoneNumber you wish to add
newDescription:  new Description
newEmail: New email
userPrincipalName: new userPrincipalName with the @domain
newSamAccountName: new username 'SamAccountName'
office: Office name
force: the switch can only be $true -or $false,
.SYNOPSIS
To start azure-Sync run:
To reset the user's Password run:
To move the user to a different OU run:
To change the user's FirstName run:
To change the user's LastName run:
To change the user's DisplayName run:
To add TelephoneNumber run:
To To change the user's Description run:
To add Email run:
To change the user's userPrincipalName run:
To change the user's SAMAccountName run :
To change the user's ServicePrincipalNames run:
to add Office location run:
.EXAMPLE

#>

