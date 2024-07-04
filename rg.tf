# 1 resource create azrue resource group 
resource "azurerm_resource_group" "tf-rg" {
  name     = "Terraform-RG"
  location = "East US"

tags = {
    environment = "production"
    costcenter  = "IT"
  }
}