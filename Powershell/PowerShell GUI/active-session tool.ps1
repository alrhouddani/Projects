

function Show-project_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formAssetActiveSessionTo = New-Object 'System.Windows.Forms.Form'
	$textbox1 = New-Object 'System.Windows.Forms.TextBox'
	$buttonCheck = New-Object 'System.Windows.Forms.Button'
	$labelAssetNumber = New-Object 'System.Windows.Forms.Label'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$formAssetActiveSessionTo_Load={
		#TODO: Initialize Form Controls here
		
	}
	
	$labelAssetNumber_Click={
		#TODO: Place custom script here
		
	}
	
	$buttonCheck_Click={
		
		$session = Get-WMIObject -class Win32_ComputerSystem -ComputerName ($textbox1.Text) | Select-Object username, Model, Name
		
		$session | Out-GridView
	}
	
	$textbox1_TextChanged={
		#TODO: Place custom script here
		
	}
	
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$formAssetActiveSessionTo.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$textbox1.remove_TextChanged($textbox1_TextChanged)
			$buttonCheck.remove_Click($buttonCheck_Click)
			$labelAssetNumber.remove_Click($labelAssetNumber_Click)
			$formAssetActiveSessionTo.remove_Load($formAssetActiveSessionTo_Load)
			$formAssetActiveSessionTo.remove_Load($Form_StateCorrection_Load)
			$formAssetActiveSessionTo.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$formAssetActiveSessionTo.SuspendLayout()
	#
	# formAssetActiveSessionTo
	#
	$formAssetActiveSessionTo.Controls.Add($textbox1)
	$formAssetActiveSessionTo.Controls.Add($buttonCheck)
	$formAssetActiveSessionTo.Controls.Add($labelAssetNumber)
	$formAssetActiveSessionTo.AutoScaleDimensions = New-Object System.Drawing.SizeF(6, 13)
	$formAssetActiveSessionTo.AutoScaleMode = 'Font'
	$formAssetActiveSessionTo.ClientSize = New-Object System.Drawing.Size(412, 207)
	$formAssetActiveSessionTo.Name = 'formAssetActiveSessionTo'
	$formAssetActiveSessionTo.Text = 'Asset Active Session Tool'
	$formAssetActiveSessionTo.add_Load($formAssetActiveSessionTo_Load)
	#
	# textbox1
	#
	$textbox1.Location = New-Object System.Drawing.Point(110, 82)
	$textbox1.Name = 'textbox1'
	$textbox1.Size = New-Object System.Drawing.Size(168, 20)
	$textbox1.TabIndex = 2
	$textbox1.add_TextChanged($textbox1_TextChanged)
	#
	# buttonCheck
	#
	$buttonCheck.Location = New-Object System.Drawing.Point(309, 79)
	$buttonCheck.Name = 'buttonCheck'
	$buttonCheck.Size = New-Object System.Drawing.Size(75, 23)
	$buttonCheck.TabIndex = 1
	$buttonCheck.Text = 'Check'
	$buttonCheck.UseVisualStyleBackColor = $True
	$buttonCheck.add_Click($buttonCheck_Click)
	#
	# labelAssetNumber
	#
	$labelAssetNumber.AutoSize = $True
	$labelAssetNumber.Location = New-Object System.Drawing.Point(12, 85)
	$labelAssetNumber.Name = 'labelAssetNumber'
	$labelAssetNumber.Size = New-Object System.Drawing.Size(73, 13)
	$labelAssetNumber.TabIndex = 0
	$labelAssetNumber.Text = 'Asset Number'
	$labelAssetNumber.add_Click($labelAssetNumber_Click)
	$formAssetActiveSessionTo.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $formAssetActiveSessionTo.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$formAssetActiveSessionTo.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$formAssetActiveSessionTo.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $formAssetActiveSessionTo.ShowDialog()

} #End Function

#Call the form
Show-project_psf | Out-Null
