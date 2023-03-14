hostname = {
  sandbox     = "app.terraform.io"
  development = ""
  stage       = ""
  production  = ""
}

tf_token = {
  sandbox     = "zyORBBAE8Vt3fA.atlasv1.S5gz1T3VkCUXpSBR1F8zjxXK16MkqD9kVliOHe9ENhjER0RzD8SWT6dMztbyGtGuR3M"
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

global_variables = {
  sandbox = {
    tf_token         = ""
    environment_code = "sandbox"
    oauth_token      = ""
  }
}

vcs = {
  sandbox = {
    gh-vidoje = {
      name             = "my-github-oauth-client"
      api_url          = "https://api.github.com"
      http_url         = "https://github.com"
      oauth_token      = ""
      service_provider = "github"
    }
  }
}
