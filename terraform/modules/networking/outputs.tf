output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_arn" {
  description = "ARN of the VPC"
  value       = aws_vpc.main.arn
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "Map of public subnet IDs keyed by subnet identifier"
  value       = { for k, s in aws_subnet.public : k => s.id }
}

output "public_subnet_cidr_blocks" {
  description = "Map of public subnet CIDR blocks keyed by subnet identifier"
  value       = { for k, s in aws_subnet.public : k => s.cidr_block }
}

output "application_subnet_ids" {
  description = "Map of application subnet IDs keyed by subnet name"
  value       = { for k, s in aws_subnet.application : k => s.id }
}

output "application_subnet_cidr_blocks" {
  description = "Map of application subnet CIDR blocks keyed by subnet name"
  value       = { for k, s in aws_subnet.application : k => s.cidr_block }
}
