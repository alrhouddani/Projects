function add-change {
    $change = Read-Host "change"
    $groupinfo = (get-ADGroup test-ad-group  -Properties *).info
    $info = "$groupinfo `r`n$change"
    Set-ADGroup -Identity $group -Replace @{info = $info }
  
}