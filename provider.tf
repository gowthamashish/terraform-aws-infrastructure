terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # S3 Remote State Storage & DynamoDB State Locking
  backend "s3" {
    bucket         = "goutham-terraform-state-bucket-ap-south-1"
    key            = "multi-tier-infra/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock-table"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}