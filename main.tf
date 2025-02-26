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
      
   
    
}