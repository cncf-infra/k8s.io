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
  region  = "ap-southeast-2"
}

# Declaring the organisation and roles
# Adding an organisation

resource "aws_organizations_organization" "Root" {
  feature_set = "ALL"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_organizations_organizational_unit" "caleb" {
  name = "caleb"
  parent_id = aws_organizations_organization.Root.id
  tags = {
    DRI = "CALEB"
  }
}



# Adding an account

resource "aws_organizations_account" "caleb" {
  name  = "caleb"
  email = "caleb+aws@ii.coop"
  iam_user_access_to_billing = "ALLOW"
  parent_id = aws_organizations_organizational_unit.caleb.id
  tags = {
    DRI = "CALEB"
  }
}
