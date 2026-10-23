data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  common_tags = merge(var.tags, {
    Project     = var.project_name
    Environment = var.environment
  })

  subnet_keys = sort(keys(var.public_subnets))
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-vpc"
  })
}

resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone != null ? each.value.availability_zone : element(data.aws_availability_zones.available.names, index(local.subnet_keys, each.key))
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-public-${each.key}"
    Tier = "Public"
  })
}
