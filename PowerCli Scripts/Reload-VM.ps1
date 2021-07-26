Function Reload-VM
{
<#
==============================================================
Script Created by : Gokul T
Email : mr.tgokul@gmail.com

===============================================================
 .SYNOPSIS
 Function to Reload the Virtual machine

 .DESCRIPTION
 Function to Reload the Virtual machine without Registering it using the VMX file

.EXAMPLE
 Reload-VM -VM <VMNAME>

#>
[CmdletBinding()]
param(
[parameter(position=0,Mandatory=$True)]
$VM
)
$VMCheck = get-vm -name $VM -ErrorAction SilentlyContinue
If ($VMCheck){Get-VM -Name $VM | Get-View | %{$_.reload()}}
Else {Write-Host "Plese enter the Correct VM Name" -ForegroundColor Yellow}
}



