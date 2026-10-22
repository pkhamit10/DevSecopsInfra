terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Configure an S3 remote backend for state management, for example:
  # backend "s3" {
  #   bucket         = "devsecops-tfstate"
  #   key            = "devsecops.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "devsecops-tfstate-lock"
  #   encrypt        = true
  # }
}
