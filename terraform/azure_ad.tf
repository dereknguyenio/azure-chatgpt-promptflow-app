resource "azuread_application" "example" {
  display_name = "streamlit-promptflow-demo"
  # Additional configurations
}

resource "azuread_application_password" "example" {
  application_object_id = azuread_application.example.object_id
  # Additional configurations
}
