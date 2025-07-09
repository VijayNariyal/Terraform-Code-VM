data "azurerm_key_vault" "Your-KVault-Name" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  name         = "VM-username"
  key_vault_id = data.azurerm_key_vault.Your-KVault-Name.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "VM-password"
  key_vault_id = data.azurerm_key_vault.Your-KVault-Name.id
}
data "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  resource_group_name = var.resource_group_name
}
