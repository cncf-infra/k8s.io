# Terraform providers

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
  alias = "us_east_1"
}

# Spin up ECR
# Create an ECR

resource "aws_ecrpublic_repository" "caleb-ecrpublic-k8s-test1" {
  provider = aws.us_east_1

  repository_name                 = "caleb-ecrpublic-k8s-test1"

  catalog_data {
    about_text        = "Caleb ECRPublic k8s test1"
    architectures     = ["ARM", "ARM 64", "x86", "x86-64"]
    description       = "Prepare for registry.k8s.io"
    operating_systems = ["Linux"]
    usage_text        = "Just testing"
  }
}

resource "aws_ecr_repository" "caleb-ecr-k8s-test1" {
  name = "caleb-ecr-k8s-test1"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
}
