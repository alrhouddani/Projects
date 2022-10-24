# Modify Active Directory user attributes Instruction
> Table of Contents
* Introduction
* Prerequisites
* How to run the script
* How to get help

## Prerequisites
> Before we start, you have to make sure that:
- Powershell ver5.0 or later.
- Credential for access to Active Directory.
- Permission to modify and update Active Directory objects.

## Introduction

> About The Script

This is a PowerShell script "Modify_AD_user". It should allow you to modify active directory attributes.

> What can you modify:
- Move active directory user to a different OU
- Reset the user’s password.
- Add a telephone number.
- Add an email address.
- Add an office.
- Start azure sync.
> Change the following user's attributes:
- FirstName.
-	LastName.
-	DisplayName.
-	Description.
-	userPrincipalName.
-	SAMAccountName.
-	Service Principal Names.
> List of all parameters:
-	Account: the ad user's SAMAccountName
-	Option: based on the request pick the switch needed
-	SPN:ServicePrincipalNames 
-	NewOU: new OrganizationalUnit 
-	Newfirstname: the new first name 
-	Newlastname: the new first name 
-	NewDisplayName: new DisplayName
-	TelephoneNumber: TelephoneNumber you wish to add
-	NewDescription:  new Description
-	Email: New email
-	UserPrincipalName: new userPrincipalName with the @domain
-	NewSamAccountName: new username 'SamAccountName'
-	Office: Office name
- Force: the switch can only be $true -or $false.
## How to run the script
Please note: parameters changes based on the request, and the following examples are meant to show you how to run the script. However, you must provide valid parameters based on your need
> To start azure-Sync: 
```
.\Modify_AD_user.ps1 -account user1 -force $true -option azure-sync
```
> To reset the user's Password:
```
.\Modify_AD_user.ps1 -account user1 -ChangeAtLogon $true -option reset-password 
```
> To move the user to a different OU:
```
.\Modify_AD_user.ps1 -account user1 -newOU 
```
> To change the user's FirstName run:
```
.\Modify_AD_user.ps1 -account user1 -newfirstname firstname1 -option firstname
```
> To change the user's LastName run:
```
.\Modify_AD_user.ps1 -account user1 -newlastname lastname1 -option lastname
```
> To change the user's DisplayName run:
```
.\Modify_AD_user.ps1 -account user1 -newDisplayName displayname1 -option displayname
```
> To add Telephone Number run:
```
.\Modify_AD_user.ps1 -account user1 -TelephoneNumber 88888888 -option telephonenumber
```
> To change the user's Description run:
```
.\Modify_AD_user.ps1 -account user1 -newDescription Description01 -option description
```
> To add Email run:
```
Modify_AD_user.ps1 -account user1 -Email user1@domain.com -option email
```
> To change the user's userPrincipalName run:
```
.\Modify_AD_user.ps1 -account user1 -userPrincipalName user1test -option userPrincipalName
```
> To change the user's SAMAccountName run:
```
.\Modify_AD_user.ps1 -account user1 -newSamAccountName user2 -option SAMAccountName
```
> To change the user's ServicePrincipalNames run:
```
.\Modify_AD_user.ps1 -account user1 -SPN 'HTTP/webserver' -option SPN
```
> to add Office location run:
```
.\Modify_AD_user.ps1 -account user1 -office Atos -option office
```

## How to get help
Open PowerShell, then navigate to the script location. If the script is located on your Desktop, then run the following:
```
Cd /Desktop
Get-help ./Modify_AD_user.ps1 -Full
```


