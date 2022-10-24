param(

    [Parameter(Mandatory = $true,
        ParameterSetName = 'account')][string] $account = $null,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'computer')][string] $computer = $null,
    #[Parameter(Mandatory)] [string] $group = $null,
    [parameter(mandatory)] [string] $option, # remove or add
    [parameter(mandatory)] [string] $object, # remove or add
    [parameter] [string] $bulk # remove or add
   
)


switch ($option) {


    'add' {

        switch ($object) {
            'account' { Write-Host "add - account siwtch was picked" }
            'computer' { Write-Host "add - computer siwtch was picked" }

        }

    }
    'remove' {

        switch ($object) {
            'account' { Write-Host "remove - computer siwtch was picked" }
            'computer' { Write-Host "remove - computer siwtch was picked" }

        }


    }


}

switch ($bulk) {


    'add' {

        switch ($bulk) {
            'account' { Write-Host "add - bulk account siwtch was picked" }
            'computer' { Write-Host "add - bulk computer siwtch was picked" }

        }

    }
    'remove' {

        switch ($bulk) {
            'account' { Write-Host "remove - bulk computer siwtch was picked" }
            'computer' { Write-Host "remove - bulk computer siwtch was picked" }

        }


    }



    
}

    
    


