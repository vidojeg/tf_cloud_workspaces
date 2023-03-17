resource "tfe_organization" "name" {
  for_each = var.tfe_organization
  name     = each.key
  email    = each.value.email
}

resource "tfe_variable_set" "varset" {
  for_each     = var.tfe_organization
  name         = format("%s-%s", each.key, "varset")
  description  = "Variable set applied to all workspaces."
  global       = true
  organization = each.key

  depends_on = [
    tfe_organization.name
  ]
}

resource "tfe_variable" "variable" {
  for_each        = { for vars in local.local_variables : "${vars.var_key}-${vars.var_value}" => vars }
  key             = each.value.var_key
  value           = each.value.var_value
  category        = "terraform"
  description     = format("%s-%s", each.value.var_key, "variables")
  sensitive       = true
  variable_set_id = tfe_variable_set.varset[each.value.set_id].id

  lifecycle {
    ignore_changes = [
      value,
    ]
    prevent_destroy = true
  }

  depends_on = [tfe_variable_set.varset]
}
