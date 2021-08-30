$RG = Get-AzResourceGroup -Name $RGN
$keyvault = New-AzKeyVault -Name "armkeyvaultaksdemo" -ResourceGroupName $RG.ResourceGroupName -Location "East US"
$GKV= Get-AzKeyVault -ResourceGroupName $RG.ResourceGroupName
Set-AzKeyVaultAccessPolicy -VaultName $GKV.VaultName -UserPrincipalName "nantu1991@aznantu1991outlook.onmicrosoft.com" -PermissionsToSecrets get,set,delete
$secretvalue = ConvertTo-SecureString "Password@123" -AsPlainText -Force
$secret = Set-AzKeyVaultSecret -VaultName $GKV.VaultName -Name "AzureVMPassword" -SecretValue $secretvalue
$secret = Get-AzKeyVaultSecret -VaultName $GKV.VaultName -Name "AzureVMPassword" -AsPlainText