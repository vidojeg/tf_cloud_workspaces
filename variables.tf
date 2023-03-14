variable "environment_code" {}
variable "workspaces" {}
variable "hostname" {
  type = map(any)
}

variable "tfe_token" {}

variable "tfe_org" {
  type = map(any)
}

# variable "vcs" {
#   type = map(any)
# }

# variable "global_variables" {}
