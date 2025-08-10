variable "location" {
  type    = string
  default = "eastus"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-python-web-app-${var.location}"
  location = var.location
}

# App Service Plan
resource "azurerm_app_service_plan" "asp" {
  name                = "asp-python-web-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Basic"
    size = "B1"
  }
  reserved = true # Linux
}

# Web App (container)
resource "azurerm_app_service" "app" {
  name                = "web-python-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "DOCKER|<DOCKER_REGISTRY>/<DOCKER_REPOSITORY>:<TAG>"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "PORT" = "8080"
  }
}
