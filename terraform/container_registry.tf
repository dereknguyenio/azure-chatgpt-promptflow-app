resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
  number  = false
}

resource "azurerm_container_registry" "example" {
  name                = "streamlitpromptflowdemoacr${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Standard"
  admin_enabled       = true
}
