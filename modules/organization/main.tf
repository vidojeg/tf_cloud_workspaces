resource "tfe_organization" "org" {
  name  = var.name
  email = var.email
}

resource "tfe_oauth_client" "vcs" {
  for_each         = var.vcs
  name             = each.value.name
  organization     = tfe_organization.org.name
  api_url          = each.value.api_url
  http_url         = each.value.http_url
  oauth_token      = each.value.oauth_token
  service_provider = each.value.service_provider
}
