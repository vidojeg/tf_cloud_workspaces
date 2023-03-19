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

  vcs_providers = flatten([
    for k, v in var.tfe_organization : [
      for vcs_prov, vcs_options in v.vcs : {
        name         = vcs_prov
        api          = vcs_options.api_url
        http         = vcs_options.http_url
        svc_provider = vcs_options.service_provider
        org          = k
      }
    ]
  ])

  workspaces = flatten([
    for k, v in var.tfe_organization : [
      for ws, ws_info in v.workspaces : {
        organization        = k
        name                = ws
        allow_destroy_plan  = ws_info.allow_destroy_plan
        tag_names           = ws_info.tag_names
        global_remote_state = ws_info.global_remote_state
        auto_apply          = ws_info.auto_apply
        git_repo            = ws_info.git_repo
        git_branch          = ws_info.git_branch
        vcs_provider        = ws_info.vcs_provider
      }
    ]
  ])

  team = flatten([
    for k, v in var.tfe_organization : [
      for team, team_info in v.teams : {
        organization = k
        name         = team
        email        = team_info
      }
    ]
  ])

  users = flatten([
    for k, v in var.tfe_organization : [
      for team, members in v.teams : [
        for emails in members : {
          organization = k
          team         = team
          email        = emails
        }
      ]
    ]
  ])
}
