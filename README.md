## terraform-azure-linux-vm

Azure Linux Virtual Machine (VM) with Cloud-Init. Ubuntu 16.04-LTS. Made for the [Provision Infrastructure with Cloud-Init](https://learn.hashicorp.com/tutorials/terraform/cloud-init) tutorial. Azure version. [This module is also on Terraform Registry](https://registry.terraform.io/modules/Eimert/linux-vm/azure/1.0.0).

## Module usage example

Export Azure subscription / service principal credentials as environment vars:
```bash
# client_id = appId of service principal
# client_secret = service principal secret
# tenant_id = directory id
export ARM_CLIENT_ID=
export ARM_CLIENT_SECRET=
export ARM_SUBSCRIPTION_ID=
export ARM_TENANT_ID=
```
Optionally create a `.env` file and source the vars: `source .env`.

Login using azure cli: 
```
az login --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID
```

Create a main.tf file, example:
```
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.17.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

module "vm" {
  source      = "github.com/Eimert/terraform-azure-linux-vm"
  location    = "westeurope"
  vm_size     = "Standard_B1s"
  cloud_init_script_location = "./scripts/add-ssh-web-app.yaml"
}
```
Copy the `add-ssh-web-app.yaml` file locally and set the `cloud_init_script_location` accordingly in main.tf.

For the rest; follow the Hashicorp Learn tutorial, see [Add your public ssh key to your cloud init script](https://learn.hashicorp.com/tutorials/terraform/cloud-init#add-your-public-ssh-key-to-your-cloud-init-script)


```bash
terraform init
terraform apply
ssh terraform@$(terraform output -raw public_ip)
```