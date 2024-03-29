resource "azurerm_storage_account" "asa_example" {
  name                     = "${var.azure_storage_account_name}${var.env}"
  resource_group_name      = "${var.azure_storage_resource_group}-${var.env}"
  location                 = var.azure_storage_location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.env
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.asa_example.name
  container_access_type = "private"
}
