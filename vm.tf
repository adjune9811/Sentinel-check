# 6 resource create vm

resource "azurerm_windows_virtual_machine" "tf-windows" {
  name                = "TF-Winvm"
  resource_group_name = azurerm_resource_group.tf-rg.name
  location            = azurerm_resource_group.tf-rg.location
  size                = "Standard_B2s"
  admin_username      = "ajay"
  admin_password      = "Azure@9716125339"
  network_interface_ids = [
    azurerm_network_interface.tf-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}