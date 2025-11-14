resource "azurerm_cognitive_deployment" "openai_model_noncompliant" {
  name                 = "openai-model-noncompliant"
  cognitive_account_id = azurerm_cognitive_account.openai.id

  model {
    format  = "OpenAI"
    name    = "o1"   # costly model → violates rule
    version = "2024-05-01"
  }

  sku {
    name     = "S0"
    capacity = 2
  }
}
