resource "azurerm_app_service_plan" "example" {
  name                = "streamlitpromptflowdemo-app-service-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Free"
    size = "F1"
  }

  kind     = "linux"
  reserved = true
}
