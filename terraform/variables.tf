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
    availability_zone = optional(string)
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

variable "application_subnets" {
  description = "Map of application subnets, keyed by subnet name (e.g. \"application-a\")"
  type = map(object({
    cidr_block        = string
    availability_zone = optional(string)
  }))
  default = {
    "application-a" = { cidr_block = "10.0.10.0/24" }
    "application-b" = { cidr_block = "10.0.11.0/24" }
  }
}

variable "data_subnets" {
  description = "Map of data subnets, keyed by subnet name (e.g. \"data-a\")"
  type = map(object({
    cidr_block        = string
    availability_zone = optional(string)
  }))
  default = {
    "data-a" = { cidr_block = "10.0.20.0/24" }
    "data-b" = { cidr_block = "10.0.21.0/24" }
  }
}

variable "aws_profile" {
  description = "AWS CLI profile used by the provider"
  type        = string
  default     = "pk"
}
