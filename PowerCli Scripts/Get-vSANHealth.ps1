Function Get-vSANHealth
{

<#
==============================================================
Script Created by : Gokul T
Email : mr.tgokul@gmail.com
===============================================================

 .SYNOPSIS
 Function to Check the vSAN Cluster health

 .DESCRIPTION
 Function to Check the vSAN Cluster health

.EXAMPLE
 Get-vSANHealth -Cluster <ClusterName>

#>
[CmdletBinding()]
param(
[parameter(position=0,Mandatory=$True)]
[String]$Cluster
)
$ClusterHost=Get-Cluster -Name $Cluster | Get-VMHost | Select-Object -First 1
$Esxcli=Get-EsxCli -VMHost $ClusterHost -V2
$Esxcli.vsan.health.cluster.list.Invoke()
}



