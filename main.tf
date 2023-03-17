module "organization" {
  source = "./modules/org"

  tfe_organization = var.tfe_org
  oauth_token      = var.oauth_token
}
