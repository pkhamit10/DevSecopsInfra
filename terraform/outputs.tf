output "environment" {
  description = "The deployed environment"
  value       = var.environment
}

output "aws_region" {
  description = "The AWS region"
  value       = var.aws_region
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.networking.vpc_cidr_block
}

output "public_subnet_a_id" {
  description = "ID of Public Subnet A"
  value       = module.networking.public_subnet_a_id
}
