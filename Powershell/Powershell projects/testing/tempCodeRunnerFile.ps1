function Write-alreadymember {
            
    Write-Host "The account: $object is already a member of the Active Directory Group: $group " -ForegroundColor Red
    Get-ADPrincipalGroupMembership -Identity $object | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
    
}
function Write-computeralreadymember {
            
    Write-Host "The account: $object is already a member of the Active Directory Group: $group " -ForegroundColor Red
    Get-ADPrincipalGroupMembership -Identity $object$ | Select-Object objectClass, SamAccountName |  Where-Object { $_.SAMAccountName -eq "$group" }
    
}
function Write-notmember {
 
    Write-Host "The account: $object is not a member of Active Directory Group: $group " -ForegroundColor red
}

#calling all function inside a switch 

switch ( $option ) {

    'add' {
        if ($members -notcontains $object -and $adgroup -eq $group) { add-account }
        elseif ($members -contains $object -and $object -eq $adaccount) { Write-alreadymember }
        elseif ($members -notcontains $object -and $object -eq $adcomputer -and $adgroup -eq $group ) { add-computer }
        elseif ($members -contains $object -and $Adcomputer -eq $object) { Write-computeralreadymember }
    }
    'remove' {
    
        if ($members -contains $object -and $object -eq $adaccount -and $group -eq $adgroup) { remove-account }
        elseif ($members -notcontains $object -and $object -eq $adaccount -and $group -eq $adgroup) { Write-notmember }
        elseif ($members -contains $object -and $object -eq $adcomputer -and $adgroup -eq $group ) { remove-computer }
        
        
    }

}