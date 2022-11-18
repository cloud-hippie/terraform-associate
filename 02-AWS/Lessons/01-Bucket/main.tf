terraform {
  backend "s3" {
    bucket = "cloud-hippie-terraform-state-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "cloud-hippie-terraform-state-bucket"
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "cloud-hippie-demo-bucket"
}

resource "aws_s3_bucket" "templates_bucket" {
  bucket = "cloud-hippie-templates-bucket"
}

resource "aws_iam_role" "iam_role" {
  name = "cloud-hippie-iam-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}