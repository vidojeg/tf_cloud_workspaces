variable "environment_code" {}

variable "hostname" {
  type = map(any)
}

variable "tf_token" {
  type = map(any)
}

variable "tfe_org" {
  type = map(any)
}

# variable "vcs" {
#   type = map(any)
# }

variable "global_variables" {}
