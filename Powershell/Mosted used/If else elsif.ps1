If ($fruit -eq "orange") { 'We found an orange' }
ElseIf ($fruit -eq "apple") { 'We found an apple' }
ElseIf ($fruit -eq "pear") { 'We found an pear' }

switch ( $fruit ) {
    'orange' { Write-Host 'We found an orange' }
    'apple' { Write-Host 'We found an apple' }
    'pear' { Write-Host 'We found an pear' }
}



