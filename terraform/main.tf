module "networking" {
  source = "./modules/networking"

  vpc_cidr     = var.vpc_cidr
  environment  = var.environment
  project_name = var.project_name
  tags         = var.tags
}
