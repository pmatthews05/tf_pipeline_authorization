variable "subscription_id" {
  description = "Subscription deploying to"
  type        = string
}

variable "ado_project_name" {
  description = "Name of the Azure DEVOps project"
  type        = string
}

variable "app_id" {
    description = "AppId of the App to use as a service account"
    type = string
}

variable "app_secret" {
    description = "Secret for the AppId"
    type = string
}
