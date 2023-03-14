terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.42.0"
    }
  }
}


provider "tfe" {
  hostname = lookup(var.hostname, var.environment_code)
  token    = lookup(var.tf_token, var.environment_code)
}
