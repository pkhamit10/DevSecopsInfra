output "environment" {
  description = "The deployed environment"
  value       = var.environment
}

output "aws_region" {
  description = "The AWS region"
  value       = var.aws_region
}

# Add resource outputs here, for example:
# output "vpc_id" {
#   description = "ID of the VPC"
#   value       = aws_vpc.main.id
# }
