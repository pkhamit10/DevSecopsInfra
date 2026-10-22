environment         = "dev"
aws_region          = "us-east-1"
project_name        = "devsecops"
vpc_cidr            = "10.0.0.0/16"
public_subnet_a_cidr = "10.0.1.0/24"

tags = {
  ManagedBy   = "Terraform"
  Project     = "DevSecopsInfra"
  Environment = "dev"
}
