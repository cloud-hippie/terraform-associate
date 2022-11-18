terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {}

variable "github_token" {}


variable "app_name" {

}
resource "heroku_app" "my_app" {
  name = github_repository.main_app.name
  region = "us"
}


resource "github_repository" "main_app" {
  name        = var.app_name
  description = "My awesome web page"
  visibility = "public"
}