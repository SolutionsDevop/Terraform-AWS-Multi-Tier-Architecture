
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.21" # optional but recommended in production environment
    }
  }

  backend "s3" {
    bucket = "multi-tier-architecture-bucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "multi-tier"
  }
}