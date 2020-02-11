provider "azurerm" {
    version = 1.43
    }

resource "azurerm_storage_account" "test" {
  name                     = "eapadlsgen2terra"
  resource_group_name      = "rg-eap-terraform-poc"
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "test" {
  name                  = "blobcontainer4test"
  storage_account_name  = azurerm_storage_account.test.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "test" {
  name                   = "TerraformBlob"
  storage_account_name   = azurerm_storage_account.test.name
  storage_container_name = azurerm_storage_container.test.name
  type                   = "Block"
}
resource "azurerm_storage_share" "test" {
  name                 = "terraformshare"  
  storage_account_name = azurerm_storage_account.test.name
  quota                = 50
}