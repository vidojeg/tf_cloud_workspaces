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
  for_each        = { for vars in local.local_variables : "${vars.var_key}" => vars }
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
    prevent_destroy = false
  }

  depends_on = [tfe_variable_set.varset]
}

resource "tfe_oauth_client" "vcs_provider" {
  for_each         = { for vars in local.vcs_providers : "${vars.name}" => vars }
  name             = each.value.name
  api_url          = each.value.api
  http_url         = each.value.http
  oauth_token      = var.oauth_token
  service_provider = each.value.svc_provider
  organization     = each.value.org

  depends_on = [
    tfe_variable.variable
  ]
}

resource "tfe_workspace" "workspace" {
  for_each                      = { for vars in local.workspaces : "${vars.name}-${vars.git_branch}" => vars }
  name                          = format("%s-%s", each.value.name, each.value.git_branch)
  organization                  = each.value.organization
  allow_destroy_plan            = each.value.allow_destroy_plan
  tag_names                     = each.value.tag_names
  global_remote_state           = each.value.global_remote_state
  auto_apply                    = each.value.auto_apply
  structured_run_output_enabled = false

  vcs_repo {
    identifier     = each.value.git_repo
    branch         = each.value.git_branch
    oauth_token_id = tfe_oauth_client.vcs_provider[each.value.vcs_provider].id
  }

  lifecycle {
    prevent_destroy = false
  }

  depends_on = [
    tfe_oauth_client.vcs_provider
  ]
}
