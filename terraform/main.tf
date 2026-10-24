module "networking" {
  source = "./modules/networking"

  vpc_cidr            = var.vpc_cidr
  public_subnets      = var.public_subnets
  application_subnets = var.application_subnets
  data_subnets        = var.data_subnets
  environment         = var.environment
  project_name        = var.project_name
  tags                = var.tags
}
