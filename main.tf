module "VPC" {
    source ="MY-MODULES/VPC"
    vpc_cidr = var.vpc_cidr
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
    env = var.env
    azs = var.azs
    
}