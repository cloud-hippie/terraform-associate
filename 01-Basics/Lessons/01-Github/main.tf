terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

variable "github_token" {}


resource "github_repository" "main_app" {
  name        = "cloud-hippie-terraform-101"
  description = "My first Terraform repository"
  visibility = "public"
}