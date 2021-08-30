Connect-AzAccount -Tenant 9172f0b8-2483-47b3-b435-0bd9b1b0dd45
Select-AzSubscription -Subscription 533d386a-5ae6-4aa2-a60b-9d586b866f82
$RGN = 'Demo-RG-ARM'
$tags = @{"USe Case"="ARM Test"; "Owner"="Srimanta Ghosh"}
$NRG = New-AzResourceGroup -Name $RGN -Location 'East US' -Tag $tags
$RG = Get-AzResourceGroup -Name $RGN
New-AzResourceGroupDeployment -Name deploy1 -ResourceGroupName $RG.ResourceGroupName -TemplateFile 'C:\ARM Template\102-Prod-Vnet.json'
#New-AzResourceGroupDeployment -Name deployparam1 -ResourceGroupName $RG.ResourceGroupName -TemplateParameterFile 'C:\ARM Template\10-kv_deploymentScript.params.json' -TemplateFile 'C:\ARM Template\10-kv_deploymentScript.json'

Read-Host 'delete RG ? press Enter to delete' 
$RG | Remove-AzResourceGroup
