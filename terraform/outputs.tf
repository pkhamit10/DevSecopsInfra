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

output "public_subnet_ids" {
  description = "Map of public subnet IDs keyed by subnet identifier"
  value       = module.networking.public_subnet_ids
}

output "application_subnet_ids" {
  description = "Map of application subnet IDs keyed by subnet name"
  value       = module.networking.application_subnet_ids
}

output "data_subnet_ids" {
  description = "Map of data subnet IDs keyed by subnet name"
  value       = module.networking.data_subnet_ids
}

output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = module.networking.internet_gateway_id
}
