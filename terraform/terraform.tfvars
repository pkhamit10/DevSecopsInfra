environment  = "dev"
aws_region   = "us-east-1"
project_name = "devsecops"
vpc_cidr     = "10.0.0.0/16"

public_subnets = {
  a = {
    cidr_block = "10.0.1.0/24"
  }
  b = {
    cidr_block = "10.0.2.0/24"
  }
}

tags = {
  ManagedBy   = "Terraform"
  Project     = "DevSecopsInfra"
  Environment = "dev"
}
