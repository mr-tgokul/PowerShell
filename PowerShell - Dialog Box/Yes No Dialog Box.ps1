﻿$UserResponse= [System.Windows.Forms.MessageBox]::Show("Do you want to Select the Cluster." , "Status" , 4)

if ($UserResponse -eq "YES" ) 
{

Write-Host "You have Selected Yes to Proceed" -BackgroundColor Green

} 

else 

{ 

Write-Host "You have Seletec No " -BackgroundColor Red

} 