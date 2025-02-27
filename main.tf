module "vpc" {
    source ="./modules/vpc"
    vpc_cidr = var.vpc_cidr
    public_subnets = var.public_subnets
     private_subnets = var.private_subnets
    env = var.env
    azs = var.azs
    account_id = var.account_id
    default_vpc_id = var.default_vpc_id
    default_vpc_cidr = var.default_vpc_cidr
    default_route_table_id = var.default_route_table_id
      
}

module "public-lb" {
    source = "./modules/ALB"
    env = var.env
    alb_sg_cidr = var.alb_sg_cidr
    subnets = module.vpc.public_subnets
    vpc_id = module.vpc.expense_id

}

module "private-lb" {
    source = "./modules/ALB"
    env = var.env
    alb_sg_cidr = var.vpc_cidr
    subnets = module.vpc.private_subnets
    vpc_id = module.vpc.expense_id

}
