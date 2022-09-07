output "admin_username" {
  value       = azurerm_linux_virtual_machine.vm.admin_username
  description = "VM admin username"
}

output "public_ip" {
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
  description = "VM public ip address"
}