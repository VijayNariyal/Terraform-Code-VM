data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "KV" {
    name                = var.key_vault_name
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false

    sku_name = "standard"

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id
    
        key_permissions = [
        "Get",
        "List",
        "Create",
        "Update",
        "Delete",
        "Purge",
        ]
    
        secret_permissions = [
        "Get",
        "List",
        "Set",
        "Delete",
        "Purge",
        ]
    
        storage_permissions = [
        "Get",
        "List",
        "Set",
        "Delete",
        ]
    }
}

resource "azurerm_key_vault_secret" "username" {
  name         = "VM-username"
  value        = "azureuser"
  key_vault_id = azurerm_key_vault.KV.id
}
resource "azurerm_key_vault_secret" "password" {
  name         = "VM-password"
  value        = "P@ssw0rd123!"
  key_vault_id = azurerm_key_vault.KV.id
}