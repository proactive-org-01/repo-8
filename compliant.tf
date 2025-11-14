# Compliant Cognitive Account (public access disabled)
resource "azurerm_cognitive_account" "openai_public_compliant" {
  name                = "openai-publicaccess-compliant"
  location            = "East US"
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "OpenAI"

  sku_name = "S0"
  sku_tier = "Standard"

  # ✅ Public access DISABLED → Compliant
  public_network_access_enabled = false
}

# Deployment attached to the compliant account
resource "azurerm_cognitive_deployment" "openai_public_compliant" {
  name                 = "openai-publicaccess-deployment"
  cognitive_account_id = azurerm_cognitive_account.openai_public_compliant.id

  model {
    format  = "OpenAI"
    name    = "gpt-35-turbo"      # Any allowed model
    version = "2024-05-01"
  }

  sku {
    name     = "S0"
    capacity = 1
  }
}
