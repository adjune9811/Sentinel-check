 output "VM-IP" {
     description = "The VM Public IP is:"
     value = azurerm_public_ip.tf-pip.ip_address
 }    