
CLOUDSCHOOL_SUBSCRIPTION_ID=4405c0b5-f638-4e0a-b7e4-c4899d4c8efe

cd /mnt/d/Entwicklung/mw-cloud-school/IaaS

terraform init

az login # will open the browser to log on
az account set --subscription $CLOUDSCHOOL_SUBSCRIPTION_ID
# register the Microsoft.Network namespace, otherwise we cannot create virtual networks
az provider register --namespace Microsoft.Network
# register the Microsoft.Network namespace, otherwise we cannot create virtual machines
az provider register --namespace Microsoft.Compute

terraform plan
# if the resource group already exists, import it first:
terraform import azurerm_resource_group.rg /subscriptions/$CLOUDSCHOOL_SUBSCRIPTION_ID/resourceGroups/Matthias_Ostermaier

terraform apply