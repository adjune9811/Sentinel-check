# 2 Resource create virtual network 
resource "azurerm_virtual_network" "tf-vnet" {
  name                = "Terraform-vnet"
  location            = azurerm_resource_group.tf-rg.location
  resource_group_name = azurerm_resource_group.tf-rg.name
  address_space       = ["10.0.0.0/16"]
}

# 3  resource create subnet

resource "azurerm_subnet" "tf-subnet" {
  name                 = "vmsubnet"
  virtual_network_name = azurerm_virtual_network.tf-vnet.name
  resource_group_name  = azurerm_resource_group.tf-rg.name
  address_prefixes     = ["10.0.0.0/24"]

}

# 4  resource create public ip

resource "azurerm_public_ip" "tf-pip" {
  name                = "vm-pip"
  allocation_method   = "Static"
  location            = azurerm_resource_group.tf-rg.location
  resource_group_name = azurerm_resource_group.tf-rg.name


}


# 5 resource create network interface

resource "azurerm_network_interface" "tf-nic" {
  name                = "Terraform-nic"
  location            = azurerm_resource_group.tf-rg.location
  resource_group_name = azurerm_resource_group.tf-rg.name

 

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tf-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tf-pip.id
  }


}

 # 6 resource create nsg 

/*
resource "azurerm_network_security_group" "tf-nsg" {
    name = "Tf-nsg"
    location            = azurerm_resource_group.tf-rg.location
  resource_group_name = azurerm_resource_group.tf-rg.name
  
  security_rule {
    name                       = "nsgrdp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }

}

*/