# Add remove object to group Instruction
> Table of Contents
* Prerequisites
* Introduction
* How to run the script
* How to get help

## Prerequisites
> Before we start, you have to make sure that:
- Powershell ver5.0 or later.
- Credential for access to Active Directory.
- Permission to modify and update Active Directory objects.
## Introduction
> About The Script

This is a PowerShell script "Add_remove_object_to_group". It should allow you to add or remove active directory object such as computers or users from an AD group. Works for both single and bulk operations.

> What can be done using this script:
- Add a user to an AD group.
- Add a computer to an AD group.
- Remove a user from an AD group.
- Remove a computer from an AD group.
- Add bulk users to a AD group.
- Add bulk computers to an AD group.
- Remove bulk users from an AD group.
- Remove bulk computers from an AD group.
- Add bulk groups to a user.
- Add bulk groups to a computer.
- Remove a user from a bulk groups.
- Remove a computer from a bulk groups.
> List of all parameters:
- Account: Use an Active Directory UserName(SamAccountName).
- Accounts: use a list of SamAccountNames in a text file
- Computer: Use an Active Directory ComputerName (HostName).
- Computers: use a list of HostNames in a txt file.
- Adobject: use a ComputerName or a UserName (SamAccountName).
- Group: use an Active Directory group or  a list of ad groups in a txt file.
- Option: add, remove, add-bulk or remove-bulk.
- Object: user, computer or group.
## How to run the script
> Add a user to an AD group.
```
.\add_remove_object_to_group.ps1 -account user1 -group group1 -option add -object user
```
> Add a computer to an AD group.
```
.\add_remove_object_to_group.ps1 -computer dev-server16 -group group1 -option add -object computer
```
> Remove a user from an AD group.
```
.\add_remove_object_to_group.ps1 -account user1 -group group1 -option remove -object user
```
> Remove a computer from an AD group.
```
.\add_remove_object_to_group.ps1 -computer dev-server16 -group group1 -option remove -object computer
```
> Add bulk users to a AD group.
* Note: The text file should contain list of all Usernames (SamAccountNames)
```
.\add_remove_object_to_group.ps1 -accounts "C:\Users\Administrator\Desktop\users.txt" -group group1 -option add-bulk -object users
```
> Add bulk computers to an AD group.
* Note: The text file should contain list of all HostNames.
```
.\add_remove_object_to_group.ps1 -computers "C:\Users\Administrator\Desktop\computers.txt" -group group1 -option add-bulk -object computers
```
> Remove bulk users from an AD group.
* Note: The text file should contain list of all Usernames (SamAccountNames)
```
.\add_remove_object_to_group.ps1 -accounts "C:\Users\Administrator\Desktop\users.txt" -group group1 -option remove-bulk -object users
```
> Remove bulk computers from an AD group.
* Note: The text file should contain list of all HostNames.
```
.\add_remove_object_to_group.ps1 -computers "C:\Users\Administrator\Desktop\computers.txt" -group group1 -option remove-bulk -object computers
```
> Add bulk groups to a user.
* Note: The Text file should contain list of all AD group names.
```
.\add_remove_object_to_group.ps1 -adobject user1 -group "C:\Users\Administrator\Desktop\Groups.txt" -type user -option add-bulk -object group
```
> Add bulk groups to a computer.
* Note: The Text file should contain list of all AD group names.
```
.\add_remove_object_to_group.ps1 -adobject dev-server16 -group "C:\Users\Administrator\Desktop\Groups.txt" -type computer -option add-bulk -object group
```
> Remove a user from a bulk groups.
* Note: The Text file should contain list of all AD group names.
```
.\add_remove_object_to_group.ps1 -adobject user1 -group "C:\Users\Administrator\Desktop\Groups.txt" -type user -option remove-bulk -object group
```
> Remove a computer from a bulk groups.
* Note: The Text file should contain list of all AD group names.
```
.\add_remove_object_to_group.ps1 -adobject dev-server16 -group "C:\Users\Administrator\Desktop\Groups.txt" -type computer -option remove-bulk -object group
```
## How to get help
Open PowerShell, then navigate to the script location. If the script is located on your Desktop, then run the following:
```
Cd /Desktop
Get-help ./add_remove_object_to_group.ps1 -Full
```
