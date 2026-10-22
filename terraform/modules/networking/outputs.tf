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

output "public_subnet_a_id" {
  description = "ID of Public Subnet A"
  value       = aws_subnet.public_a.id
}

output "public_subnet_a_cidr_block" {
  description = "CIDR block of Public Subnet A"
  value       = aws_subnet.public_a.cidr_block
}
