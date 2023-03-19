tfe_org = {
  azure-blueprints-sandbox = {
    email = "vidoje.gavrilovich@gmail.com"
    teams = {
      devops     = ["me@vidojeg.cloud", "vidojegavrilovic94@hotmail.rs"]
      developers = ["olnmnjssdahpfqbkbr@tcwlx.com"]
    }
    vcs = {
      github = {
        api_url          = "https://api.github.com"
        http_url         = "https://github.com"
        service_provider = "github"
      }
    }
    workspaces = {
      azure-infra-main = {
        allow_destroy_plan  = false
        tag_names           = ["sandbox"]
        global_remote_state = true
        auto_apply          = false
        git_repo            = "vidojeg/azure-blueprints"
        git_branch          = "main"
        vcs_provider        = "github"
      }
      azure-infra-production = {
        allow_destroy_plan  = false
        tag_names           = ["production", "infra"]
        global_remote_state = true
        auto_apply          = false
        git_repo            = "vidojeg/azure-blueprints"
        git_branch          = "production"
        vcs_provider        = "github"
      }
      azure-infra-develop = {
        allow_destroy_plan  = false
        tag_names           = ["develop", "azure"]
        global_remote_state = true
        auto_apply          = false
        git_repo            = "vidojeg/azure-blueprints"
        git_branch          = "develop"
        vcs_provider        = "github"
      }
    }
    global_variables = {
      tfe_token        = ""
      environment_code = ""
      oauth_token      = ""
    }
  }
}
