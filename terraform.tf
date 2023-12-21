terraform {

  cloud {
    organization = "devops_study"

    workspaces {
      name = "learn-terraform-github-actions"
    }
  }

  required_providers {
    googleworkspace = {
      source = "hashicorp/googleworkspace"
      version = "0.7.0"
    }

  }

  required_version = ">= 0.4.0"
}
