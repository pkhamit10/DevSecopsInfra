variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "Map of public subnets, keyed by subnet identifier (e.g. \"a\", \"b\")"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
  default = {}
}

variable "environment" {
  description = "Deployment environment (e.g. dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project, used for naming resources"
  type        = string
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}
