param(
    [parameter(mandatory)] [string] $option
)


switch ( $option ) {

    'add' { Write-Host "add was used" -ForegroundColor green }
    'remove' { Write-Host "remove was" -ForegroundColor red }

}

