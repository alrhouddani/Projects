Add-Type -AssemblyName system.windows.forms
$FormObject = [system.windows.forms.form]
$LablObject = [system.windows.forms.label]

$helloworldform=New-Object $FormObject
$helloworldform.clientsize= '500,300'
$helloworldform.text='hello world'
$helloworldform.backcolor='white' #or 'ffffff'
$Labl=New-Object $LablObject
$Labl.text='Hello World'
$Labl.AutoSize=$true
$Labl.Font='verdana,24,style=Bold'
$Labl.location=New-Object System.Drawing.Point(120,110)
$helloworldform.Controls.AddRange(@($Labl))
#display form
$helloworldform.showDialog()
#clean up the form
$helloworldform.Dispose()

