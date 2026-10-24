data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  common_tags = merge(var.tags, {
    Project     = var.project_name
    Environment = var.environment
  })

  subnet_keys             = sort(keys(var.public_subnets))
  application_subnet_keys = sort(keys(var.application_subnets))
  data_subnet_keys        = sort(keys(var.data_subnets))
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

resource "aws_subnet" "application" {
  for_each = var.application_subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone != null ? each.value.availability_zone : element(data.aws_availability_zones.available.names, index(local.application_subnet_keys, each.key))
  map_public_ip_on_launch = false

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-${each.key}"
    Tier = "Application"
  })
}

resource "aws_subnet" "data" {
  for_each = var.data_subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone != null ? each.value.availability_zone : element(data.aws_availability_zones.available.names, index(local.data_subnet_keys, each.key))
  map_public_ip_on_launch = false

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-${each.key}"
    Tier = "Data"
  })
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-igw"
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-public-rt"
  })
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}
