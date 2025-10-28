terraform {
  cloud {
    organization = "cloudgenius-acme"   # use your real org name
    workspaces {
      name = "paloalto-nva-poc"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
