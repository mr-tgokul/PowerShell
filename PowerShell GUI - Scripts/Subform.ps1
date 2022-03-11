# Main Form

$mainform = New-Object System.Windows.Forms.Form
$mainform.Text = "Main Configuration Page"
$mainform.Size=New-Object System.Drawing.Size(500,700)
$mainform.StartPosition="CenterScreen"

# Button to Open Sub Form

$subformbutton=New-Object System.Windows.Forms.Button
$subformbutton.Location = New-Object System.Drawing.Size(150,450)
$subformbutton.Size=New-Object System.Drawing.Size(200,30)
$subformbutton.Text="Sub Form"
$mainform.Controls.Add($subformbutton)

#Sub Form

$subform=New-Object System.Windows.Forms.Form
$subform.Text="Sub Form!"
$subform.Size=New-Object System.Drawing.Size(400,600)
$subform.StartPosition="CenterScreen"

#Label in Sub Form to Dispaly Sucess message

$Subformlabel=New-Object System.Windows.Forms.Label
$Subformlabel.Location=New-Object System.Drawing.Size(50,350)
$Subformlabel.Size=New-Object System.Drawing.Size(300,20)
$Subformlabel.ForeColor ="Green"
$Subformlabel.Font = New-Object System.Drawing.Font ('Times New Romain', 8,[System.Drawing.FontStyle]::Bold)
$Subformlabel.Text="Sub Form Opened Successfully !"
$subform.Controls.Add($Subformlabel)

# Action for Subform Button Click

$subformbutton.Add_Click({
$subform.ShowDialog()
})


# Menu Strip

$menustrip=New-Object System.Windows.Forms.MenuStrip
$filemenu=New-Object System.Windows.Forms.ToolStripMenuItem
$viewmenu=New-Object System.Windows.Forms.ToolStripMenuItem
$helpmenu=New-Object System.Windows.Forms.ToolStripMenuItem
$menuexit=New-Object System.Windows.Forms.ToolStripMenuItem
$opensubform=New-Object System.Windows.Forms.ToolStripMenuItem
$about=New-Object System.Windows.Forms.ToolStripMenuItem


#Menu Bar
[void]$mainform.Controls.Add($menustrip)

#Menu - File
$filemenu.Text = "File"
$filemenu.Font=New-Object System.Drawing.Font('Times New Roman',10)
[Void]$menustrip.Items.Add($filemenu)

#Menu - View
$viewmenu.Text="View"
$viewmenu.Font=New-Object System.Drawing.Font('Times New Roman',10)
[void]$menustrip.Items.Add($viewmenu)

#Menu - Help
$helpmenu.Text="Help"
$helpmenu.Font=New-Object System.Drawing.Font('Times New Roman',10)
[void]$menustrip.Items.Add($helpmenu)


#Menu Options - File
$menuexit.Text="Exit"
$menuexit.Font=New-Object System.Drawing.Font('Times New Roman',10)
$menuexit.Add_Click({$mainform.Close()
})
[void]$filemenu.DropDownItems.Add($menuexit)

#Menu Options - View
$opensubform.Text = "Sub Form"
$opensubform.Font=New-Object System.Drawing.Font('Times New Roman',10)
$opensubform.Add_Click({
$subform.ShowDialog()
})
[void]$viewmenu.DropDownItems.Add($opensubform)

#Menu Options - Help
$about.Text="About"
$about.Font=New-Object System.Drawing.Font('Times New Roman',10)
[void]$helpmenu.DropDownItems.Add($about)

#Subform Key actions
$subform.KeyPreview = $True
$subform.Add_KeyDown({if($_.KeyCode -eq “Enter”)
{$subform.Close()}})
$subform.Add_KeyDown({if($_.KeyCode -eq “Escape”)
{$subform.Close()}})




$mainform.ShowDialog()