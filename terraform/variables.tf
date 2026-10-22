variable "environment" {
  description = "Deployment environment (e.g. dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project, used for naming resources"
  type        = string
  default     = "devsecops"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Map of public subnets, keyed by subnet identifier (e.g. \"a\", \"b\")"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
  default = {}
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
    Project   = "DevSecopsInfra"
  }
}
