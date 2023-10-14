#############################################################################
# PROVIDERS
#############################################################################

terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "2.96.0"
    }
  }
}


provider "azurerm" {
  subscription_id   =   "dcef3c7d-8826-4aab-af4c-75701cfed8bf"
  client_id         =   "fff915fc-3e62-4642-9fa5-9ca41c7a7ff3"
  tenant_id         =   "24d4dadd-0689-4992-9ae3-1ced23e732d6"
  features {}
}



resource "azurerm_resource_group" "app_grp" {
    name = "app-grp"
    location = "francecentral"
}

resource "azurerm_app_service_plan" "planamz" {
  name                = "planamz-appserviceplan"
  location            = azurerm_resource_group.app_grp.location
  resource_group_name = azurerm_resource_group.app_grp.name

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "webaappamz" {
  name                = "example-amz-app-service"
  location            = azurerm_resource_group.app_grp.location
  resource_group_name = azurerm_resource_group.app_grp.name
  app_service_plan_id = azurerm_app_service_plan.planamz.id
}