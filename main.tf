resource "tfe_variable_set" "test" {
  name         = "sandbox-test"
  description  = "Variable set applied to all workspaces."
  global       = true
  organization = lookup(var.tfe_org, var.environment_code)
}
