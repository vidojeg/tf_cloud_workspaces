module "organization" {
  source = "./modules/org"

  name  = lookup(var.tfe_org, var.environment_code)
  email = lookup(var.email, var.environment_code)
}

module "workspaces" {
  source = "./modules/workspaces"

  tfe_org          = lookup(var.tfe_org, var.environment_code)
  global_varset    = var.environment_code
  global_variables = lookup(var.global_variables, var.environment_code)
  vcs              = lookup(var.vcs, var.environment_code)
}
