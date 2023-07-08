data "azurerm_subscription" "azurerm_scope_subscription" {
  subscription_id = var.subscription_id
}

data "azuredevops_project" "ado_project" {
  name = var.ado_project_name
}

data "azuread_service_principal" "service_app" {
application_id = var.app_id
}