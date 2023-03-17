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
  sensitive       = false
  variable_set_id = tfe_variable_set.varset.id

  lifecycle {
    ignore_changes = [
      value,
    ]
    prevent_destroy = false
  }

  depends_on = [tfe_variable_set.varset]
}
