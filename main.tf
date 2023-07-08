resource "azuredevops_serviceendpoint_azurerm" "subscription" {
  project_id            = data.azuredevops_project.ado_project.id
  service_endpoint_name = "${data.azuredevops_project.ado_project.name}-sub"
  description           = "Managed by Terraform"
  credentials {
    serviceprincipalid  = var.app_id
    serviceprincipalkey = var.app_secret
  }
  azurerm_spn_tenantid      = data.azurerm_subscription.azurerm_scope_subscription.tenant_id
  azurerm_subscription_id   = data.azurerm_subscription.azurerm_scope_subscription.subscription_id
  azurerm_subscription_name = data.azurerm_subscription.azurerm_scope_subscription.display_name
}

resource "azuredevops_pipeline_authorization" "authorize" {
  project_id  = data.azuredevops_project.ado_project.id
  resource_id = azuredevops_serviceendpoint_azurerm.subscription.id
  type        = "endpoint"
} 

resource "azuredevops_resource_authorization" "authorize2" {
    project_id = data.azuredevops_project.ado_project.id
    resource_id = azuredevops_serviceendpoint_azurerm.subscription.id
    authorized = true
}

resource "azurerm_role_assignment" "subscription_access" {
  scope                = data.azurerm_subscription.azurerm_scope_subscription.id
  role_definition_name = "Owner"
  principal_id         = data.azuread_service_principal.service_app.object_id
  }