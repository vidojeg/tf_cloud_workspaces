module "organization" {
  source = "./modules/organization"
  name   = lookup(var.org_name, var.environment_code)
  email  = lookup(var.org_email, var.environment_code)

  vcs        = lookup(var.vcs, var.environment_code)
  workspaces = lookup(var.workspaces, var.environment_code)

}
