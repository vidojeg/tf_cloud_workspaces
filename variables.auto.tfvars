hostname = {
  sandbox     = "app.terraform.io"
  development = ""
  stage       = ""
  production  = ""
}

tf_token = {
  sandbox     = ""
  development = ""
  stage       = ""
  production  = ""
}

org_name = {
  sandbox     = "azure-blueprints"
  development = ""
  stage       = ""
  production  = ""
}

org_email = {
  sandbox     = "vidoje.gavrilovich@gmail.com"
  development = ""
  stage       = ""
  production  = ""
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

vars = {
  sandbox = {
    environment_code = ""
    tf_token         = ""

  }
}

workspaces = {
  sandbox = {
    azure-blueprints-infra = {
      name                = "azure-blueprints-infra"
      allow_destroy_plan  = false
      auto_apply          = false
      global_remote_state = true
      terraform_version   = "latest"
      tags                = ["sandbox"]
      git_repo            = "vidojeg/azure-blueprints"
      git_branch          = "main"
    }
  }
  development = {}
  stage       = {}
  production  = {}
}
