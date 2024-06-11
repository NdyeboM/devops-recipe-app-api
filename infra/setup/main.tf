terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket         = "ndyebo-udemy-recipe-api-tfstate"
    key            = "tf-state-setup"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "ndyebo-udemy-recipe-api-tf-lock"
  }
}

provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}
