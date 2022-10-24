Add-Type -AssemblyName system.windows.forms
$FormObject=[System.Windows.Forms.Form]
$LablObject=[System.Windows.Forms.Label]
$comboboxObject=[System.Windows.Forms.ComboBox]
$Default1='verdana,11'

#base form
$AppForm=New-Object $FormObject
$AppForm.clientsize='419,209'
$AppForm.text='Service Status'
$AppForm.backcolor='white'
#build
$Lablservice=New-Object $LablObject
$Lablservice.text='Service'
$Lablservice.AutoSize=$true
$Lablservice.location=New-Object System.Drawing.Point(35,13)
#Drop down
$DropService=New-Object $comboboxObject
$DropService.Location=New-Object System.Drawing.Point(203,21)
$DropService.width='300'

#Load the Drop Down
Get-Service | ForEach-Object {$DropService.Items.Add($_.Name)}
$DropService.Text='Pick a Service'

$Lablservicename=New-Object $LablObject
$Lablservicename.text='Service name:'
$Lablservicename.AutoSize=$true
$Lablservicename.location=New-Object System.Drawing.Point(35,13)

$servicename=New-Object $LablObject
$servicename.text='test'
$servicename.AutoSize=$true
$servicename.location=New-Object System.Drawing.Point(35,13)
#$Services = Get-Service
#foreach($service in $services){
   # $DropService.Items.Add($service.Name)
#}

#display the form
$AppForm.Controls.AddRange(@($Lablservice,$DropService,$Lablservicename,$servicename))
$Lablservice.Font=$Default1

#show form
$AppForm.showDialog()
$AppForm.display()

