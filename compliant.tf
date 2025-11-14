resource "azurerm_cognitive_deployment" "openai_model_compliant" {
  name                 = "openai-model-compliant"
  cognitive_account_id = azurerm_cognitive_account.openai.id

  model {
    format = "OpenAI"
    name   = "gpt-35-turbo"
  }

  sku {
    name     = "S0"
    capacity = 2
  }
}
