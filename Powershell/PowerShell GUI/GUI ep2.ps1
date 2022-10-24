Add-Type -AssemblyName system.windows.forms
$FormObject = [system.windows.forms.form]
$LablObject = [system.windows.forms.label]
$ButtonObject= [system.windows.forms.button]

$helloworldform=New-Object $FormObject
$helloworldform.clientsize= '500,300'
$helloworldform.text='hello world'
$helloworldform.backcolor='white' #or 'ffffff'
$Labl=New-Object $LablObject
$Labl.text='Hello World'
$Labl.AutoSize=$true
$Labl.Font='verdana,24,style=Bold'

$bthello=New-Object $ButtonObject
$bthello.text='Say hello'
$bthello.AutoSize=$tru0
$bthello.Font='verdana.14'
$bthello.location=New-Object System.Drawing,System.Drawing.Point(175,180)
#logic section
function HelloWorld {
    if($Labl.text -eq 'Hello world'){
        $Labl.Text='Hello World'
    }else {
            $Labl.Text=''}
}
$bthello.add_Click({HelloWorld})

$Labl.location= New-Object System.Drawing.Point(75,120)
$helloworldform.Controls.AddRange(@($Labl,$bthello))
#display form
$helloworldform.showDialog()
#clean up the form
$helloworldform.Dispose()

