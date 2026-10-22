environment  = "dev"
aws_region   = "us-east-1"
project_name = "devsecops"
vpc_cidr     = "10.0.0.0/16"

public_subnets = {
  a = {
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"
  }
  b = {
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b"
  }
}

tags = {
  ManagedBy   = "Terraform"
  Project     = "DevSecopsInfra"
  Environment = "dev"
}
