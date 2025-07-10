data "azurerm_subnet" "subnet" {
    name                 = var.subnet_name
    resource_group_name  = var.resource_group_name
    virtual_network_name = var.virtual_network_name
}

data "azurerm_public_ip" "pip" {
      name                = var.public_ip_name
      resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "nic" {
    name                = var.network_interface_name
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name
        
    ip_configuration {
        name                          = "internal"
        subnet_id                     = data.azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = data.azurerm_public_ip.pip.id
        
    }
    
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = data.azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
