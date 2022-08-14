variable "rg_name" {
  description = "Resource Group name"
  default     = "rg-instance"
}

variable "location" {
  description = "The Azure location to deploy your vm"
  default     = "westeurope"
}

variable "vm_size" {
  description = "Azure VM size"
  default     = "Standard_F2"
}

variable "cloud_init_script_location" {
  description = "Cloud init script location from where the module is invoked"
  default     = "./scripts/add-ssh-web-app.yaml"
}