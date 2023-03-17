terraform {
  backend "remote" {
    organization = lookup(var.tfe_org, var.environment_code)

    workspaces {
      name = lookup(var.workspaces, var.environment_code)
    }
  }
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.42.0"
    }
  }
}


provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.tfe_token
}
