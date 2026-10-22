module "networking" {
  source = "./modules/networking"

  vpc_cidr            = var.vpc_cidr
  public_subnet_a_cidr = var.public_subnet_a_cidr
  availability_zone_a  = "${var.aws_region}a"
  environment         = var.environment
  project_name        = var.project_name
  tags                = var.tags
}
