
param(

    [Parameter(Mandatory = $true,
        ParameterSetName = 'account')][string] $account = $null,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'computer')][string] $computer = $null,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'accounts')][string] $accounts = $null,
    [Parameter(Mandatory = $true,
        ParameterSetName = 'computers')][string] $computers = $null,
    [Parameter(Mandatory)] [string] $group = $null,
    [parameter(mandatory)] [string] $option, # remove or add
    [parameter(mandatory)] [string] $object # remove or add
   
)





# add user to group
# remove user from group
# add computer to group
# remove computer to group
#bulk add users to group           #users
#bulk add computers to group        #computers
#bulk add groups to user            #groups
#bulk add groups to computer        #groups

switch ($option) {


    'add' {

        switch ($object) {
            'user' {}
            'computer' {}
        }
    } 'remove' {

        switch ($object) {

            'user' {}
            'computer' {}
        }
    }
}