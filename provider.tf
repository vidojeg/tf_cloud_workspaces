terraform {
  # backend "remote" {
  #   organization = "tfe_main"

  #   workspaces {
  #     name = "tfe_cloud_workspaces"
  #   }
  # }
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
