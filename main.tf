module "organization" {
  source = "./modules/org"

  tfe_organization = var.tfe_org
}

# module "workspaces" {
#   source = "./modules/workspaces"

#   tfe_org          = lookup(var.tfe_org, var.environment_code)
#   global_varset    = var.environment_code
#   global_variables = lookup(var.global_variables, var.environment_code)
# }
