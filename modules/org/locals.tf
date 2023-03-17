locals {
  local_variables = flatten([
    for k, v in var.tfe_organization : [
      for var_key, var_val in v.global_variables : {
        var_key   = var_key
        var_value = var_val
        set_id    = k
      }
    ]
  ])
}

locals {
  vcs_providers = flatten([
    for k, v in var.tfe_organization : [
      for vcs_prov, vcs_options in v.vcs : {
        name         = vcs_prov
        api          = vcs_options.api_url
        http         = vcs_options.http_url
        token        = vcs_options.oauth_token
        svc_provider = vcs_options.service_provider
        org          = k
      }
    ]
  ])
}

locals {
  org_name = flatten([
    for key, value in var.tfe_organization : {
      name = key
    }
  ])
}
