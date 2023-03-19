variable "tfe_token" {}

variable "tfe_org" {
  type = map(object({
    email            = string
    workspaces       = map(any)
    global_variables = map(any)
    vcs              = map(any)
    teams            = map(any)
  }))
}

variable "oauth_token" {}
