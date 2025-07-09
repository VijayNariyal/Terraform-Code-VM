module "rg" {
  source = "../RG"
    resource_group_name = "RG-Terraform"
    resource_group_location = "East US"
}
module "key_vault" {
  depends_on = [ module.rg ]
  source = "../KV"
  key_vault_name = "Your-KVault-Name"
  resource_group_name = "RG-Terraform"
  resource_group_location = "East US"
}
module "virtual_network" {
  depends_on = [ module.rg ]
  source = "../VNET"
  virtual_network_name = "VNet-Terraform"
  resource_group_name = "RG-Terraform"
  resource_group_location = "East US"
}

module "network_interface" {
  depends_on = [ module.subnet, module.public_ip ]
  source = "../NIC"
  network_interface_name = "NIC-Terraform"
  resource_group_name = "RG-Terraform"
    resource_group_location = "East US"
    subnet_name = "Subnet-Terraform"
    virtual_network_name = "VNet-Terraform"
    public_ip_name = "PIP-Terraform"
    nsg_name = "NSG-Terraform"
}
module "subnet" {
    depends_on = [ module.virtual_network ]
  source = "../SUBNET"
  subnet_name = "Subnet-Terraform"
  resource_group_name = "RG-Terraform"
  virtual_network_name = "VNet-Terraform"
}
module "public_ip" {
    depends_on = [ module.rg ]
  source = "../PIP"
  public_ip_name = "PIP-Terraform"
  resource_group_name = "RG-Terraform"
  resource_group_location = "East US"
}
module "vm" {
    depends_on = [ module.virtual_network, module.public_ip, module.key_vault ]
  source = "../VM"
  virtual_machine_name = "VM-Terraform"
  resource_group_name = "RG-Terraform"
  resource_group_location = "East US"
  network_interface_name = "NIC-Terraform"
  key_vault_name = "Your-KVault-Name"
}

