module "network" {
  source         = "./modules/network"
  name           = "employeeapp"
  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets= ["10.0.11.0/24", "10.0.12.0/24"]
  azs            = ["us-east-1a", "us-east-1b"]
}

module "security" {
  source = "./modules/security"

  vpc_id = module.network.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  subnet_id  = module.network.public_subnet_ids[0]
  ec2_sg_id  = module.security.ec2_sg_id
}

module "alb" {
  source = "./modules/alb"

  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  alb_sg_id          = module.security.alb_sg_id
  ec2_instance_id    = module.ec2.ec2_id
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnets" {
  value = module.network.public_subnet_ids
}

output "private_subnets" {
  value = module.network.private_subnet_ids
}

output "ec2_public_ip" {
  value = module.ec2.ec2_public_ip
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}