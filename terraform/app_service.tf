resource "azurerm_app_service" "example" {
  name                = "streamlit-promptflow-demo-webapp"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    linux_fx_version = "DOCKER|${azurerm_container_registry.example.login_server}/${var.docker_image_name}:latest"
    always_on        = false
    http2_enabled    = false
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"      = "https://${azurerm_container_registry.example.login_server}"
    "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.example.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.example.admin_password
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "WEBSITES_PORT"                        = "8501"
    # Additional necessary environment variables
  }

  identity {
    type = "SystemAssigned"
  }
}
