resource "azurerm_cognitive_deployment" "openai_capacity_compliant" {
  name                 = "openai-capacity-compliant"
  cognitive_account_id = azurerm_cognitive_account.openai.id

  model {
    format  = "OpenAI"
    name    = "gpt-35-turbo"
    version = "2024-05-01"
  }

  sku {
    name     = "S0"
    capacity = 8   # ✅ Compliant (≤ 10)
  }
}
