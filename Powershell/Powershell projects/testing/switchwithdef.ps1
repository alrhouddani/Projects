param(

    [Parameter(Mandatory = $true,
        ParameterSetName = 'test1')][string] $test1 = $null,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'test2')][string] $test2 = $null,
    [parameter(mandatory)] [string] $object 



)






switch ($object) {
    'test1' { write-Host "test1" }
    'test2' { write-Host "test2" }
    Default { write-Host "Default" }
}

