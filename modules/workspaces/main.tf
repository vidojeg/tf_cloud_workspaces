resource "tfe_variable_set" "varset" {
  name         = var.global_varset
  description  = "Variable set applied to all workspaces."
  global       = true
  organization = var.tfe_org
}

resource "tfe_variable" "variable" {
  for_each        = var.global_variables
  key             = each.key
  value           = each.value
  category        = "terraform"
  description     = format("%s-%s", "variables", each.key)
  sensitive       = true
  variable_set_id = tfe_variable_set.varset.id

  lifecycle {
    ignore_changes = [
      value,
    ]
    prevent_destroy = true
  }

  depends_on = [tfe_variable_set.varset]
}

resource "tfe_oauth_client" "vcs" {
  for_each         = var.vcs
  name             = each.value.name
  organization     = var.tfe_org
  api_url          = each.value.api_url
  http_url         = each.value.http_url
  oauth_token      = each.value.oauth_token
  service_provider = each.value.service_provider
}
