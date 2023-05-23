# Sign in to Azure Subscription
Connect-AzAccount

# List the Available Location 
Get-AzLocation | Select-Object -Property $Location

# Create a Resource Group

$Location = 'EASTUS'
$ResourceGroup = 'MyResourcegroup'
New-AzResourceGroup -Name $ResourceGroup -Location $Location


# Create A Storage Account
$StorageHT = @{
  ResourceGroupName = $ResourceGroup
  Name              = 'mystorage123'
  SkuName           = 'Standard_LRS'
  Location          = $Location
}
$StorageAccount = New-AzStorageAccount @StorageHT
$Context = $StorageAccount.Context