Function Find-Esxihost
{
<#
==============================================================
Script Created by : Gokul T
Email : mr.tgokul@gmail.com
===============================================================
 .SYNOPSIS
 Function to find the Esxi host using its Serial Number and vice versa

 .DESCRIPTION
  Function to find the Esxi host using its Serial Number and vice versa

.EXAMPLE
 Find-Esxihost -Serial_number "Serialnumber"
 Find-Esxihost -Hostname "Hostname"

#>
      [CmdletBinding()]

      param(
            [Parameter(Mandatory = $false)][string]$Serial_number,
            [Parameter(Mandatory = $false)]$Hostname
      )
 
 if ($Serial_number){
foreach ($servers in ((Get-VMHost).Name))
{
  $Service_tag=((Get-View -viewtype Hostsystem -Property Name,Hardware -filter @{"Name"="$servers"}).Hardware.SystemInfo.OtherIdentifyingInfo | where {$_.IdentifierType.Key -eq "ServiceTag"}).IdentifierValue
   if($Service_tag -eq $Serial_number) {
      Write-host "The Host name of $Service_tag is $servers" -ForegroundColor Yellow
      Break }
  }}
if(!($Serial_number))
{
   $Server_Serial = ((Get-View -viewtype Hostsystem -Property Name,Hardware -filter @{"Name"="$Hostname"}).Hardware.SystemInfo.OtherIdentifyingInfo | where {$_.IdentifierType.Key -eq "ServiceTag"}).IdentifierValue
   Write-Host "The Serial number of $Hostname is $Server_Serial" -ForegroundColor Green
   }
  }