#==AzSK Demo ==

$subId = '<SUBID>'
$LogAnalyticsWSId = '<WSID>'
$LogAnalyticsWSKey= '<WSKEY>'
$email = 'email@contoso.com'
$phoneno = '0400123456'
Install-Module AzSK ; Import-Module AzSK ; Set-AzSKPolicySettings -AutoUpdate On
Get-AzSKSubscriptionSecurityStatus -SubscriptionId $subId
Get-AzSKAzureServicesSecurityStatus -SubscriptionId $subId -ResourceGroupNames *

Set-AzSKSubscriptionSecurity -SubscriptionId $subId -SecurityContactEmails $email -SecurityPhoneNumber $phoneno

Install-AzSKContinuousAssurance -SubscriptionId $subId `
        -AutomationAccountLocation australiasoutheast `
        -AutomationAccountRGName AZSK-RG01 `
        -AutomationAccountName AutomationAccount01 `
        -ResourceGroupNames * `
        -LAWSId   $LogAnalyticsWSId`
        -LAWSSharedKey $LogAnalyticsWSKey 

#Can be setup for multiple subscriptions from central location "Central Scan Mode" - 


#======LIGHTHOUSE DEMO===============

#Check if new provider is on
Get-AzResourceProvider -ProviderNameSpace 'Microsoft.ManagedServices'

#Get an example role - add to params
(Get-AzRoleDefinition -Name 'Virtual Machine Contributor').id

#Stripped before pushing to GIT
#Get prinicpal ID - Add to params
#Get Source Tenant ID - Add to params

New-AzDeployment -TemplateFile .\AzureDeploy.Json -TemplateParameterFile .\AzureDeployParameters.Json -Location australiaeast