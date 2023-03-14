hostname = {
  sandbox     = "app.terraform.io"
  development = ""
  stage       = ""
  production  = ""
}

tfe_org = {
  sandbox     = "azure-blueprints"
  development = ""
  stage       = ""
  production  = ""
}

workspaces = {
  prototype = "tf_cloud_workspaces"
  dev       = "tf_cloud_workspaces"
  qa        = "tf_cloud_workspaces"
  stage     = "tf_cloud_workspaces"
  prod      = "tf_cloud_workspaces"
}
global_variables = {
  sandbox = {
    tfe_token        = ""
    environment_code = ""
    oauth_token      = ""
  }
}

# vcs = {
#   sandbox = {
#     gh-vidoje = {
#       name             = "my-github-oauth-client"
#       api_url          = "https://api.github.com"
#       http_url         = "https://github.com"
#       oauth_token      = ""
#       service_provider = "github"
#     }
#   }
# }
