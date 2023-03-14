variable "environment_code" {}

variable "hostname" {
  type = map(any)
}

variable "tf_token" {
  type = map(any)
}

variable "org_name" {
  type = map(any)
}

variable "org_email" {
  type = map(any)
}

variable "workspaces" {
  type = map(any)
}

variable "vcs" {
  type = map(any)
}
