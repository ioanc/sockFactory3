#!/bin/bash

export RESOURCE_GROUP_NAME=dhlgroup-twright
export LOCATION=eastus
export VM_NAME=dhlreprovm2
export VM_IMAGE=Canonical:0001-com-ubuntu-minimal-jammy:minimal-22_04-lts:22.04.202207180
export ADMIN_USERNAME=azureuser
export SSH_KEY_LOCATION="~/.ssh/id_rsa.pub"

export DBNAME=dhlreprodb
export SERVERNAME=dhlrepro
export USERNAME=dhlrepro
export PASSWORD=Passw0rD1234

let "randomIdentifier=$RANDOM*$RANDOM"

public_ip=`curl ifconfig.me`
echo "public IP: $public_ip"

#install prerequisites

#curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
#az login
#az account show

Create a single database and configure a firewall rule

# Specify appropriate IP address values for your environment
# to limit access to the SQL Database server
startIp=public_ip
endIp=public_ip

# Variable block

echo "Creating resource group: $RESOURCE_GROUP_NAME in $LOCATION..."
#az group create --name $RESOURCE_GROUP_NAME --location "$LOCATION"



# echo "Creating $SERVER in $LOCATION..."
az sql server create --name $SERVERNAME --resource-group $RESOURCE_GROUP_NAME --location "$LOCATION" --admin-user $USERNAME --admin-password $PASSWORD
# # echo "Configuring firewall..."
az sql server firewall-rule create --resource-group $RESOURCE_GROUP_NAME --server $SERVERNAME -n AllowYourIp --start-ip-address $startIp --end-ip-address $endIp
# # echo "Creating $database on $server..."
az sql db create --resource-group $RESOURCE_GROUP_NAME --server $SERVERNAME --name $DBNAME --sample-name AdventureWorksLT --edition GeneralPurpose --family Gen5 --capacity 2 --zone-redundant true # zone redundancy is only supported on premium and business critical service tiers

#ssh-keygen -m PEM -t rsa -b 4096 -f ~/.ssh/azure_vm

# echo "Creating VM: $VM_NAME  in $LOCATION..."
az vm create \
  --resource-group $RESOURCE_GROUP_NAME \
  --name $VM_NAME \
  --image $VM_IMAGE \
  --admin-username $ADMIN_USERNAME \
  --ssh-key-values $SSH_KEY_LOCATION \
  --public-ip-sku Standard

vm_public_ip=`az vm show -d -g $RESOURCE_GROUP_NAME -n $VM_NAME --query publicIps -o tsv`

echo "Now, you can ssh using this command:"
echo "ssh -i ~/.ssh/azure_vm azureuser@$vm_public_ip"


