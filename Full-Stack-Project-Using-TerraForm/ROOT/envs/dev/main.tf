module "vpc" {
  source                = "../../modules/infrastructure"
  vpc_name              = "3-tier-vpc"
  vpc_cidr              = "10.0.0.0/16"
  availability_zone_1a  = "us-east-1a"
  availability_zone_1b  = "us-east-1b"
  public_subnet_1_cidr  = "10.0.1.0/24"
  public_subnet_2_cidr  = "10.0.2.0/24"
  private_subnet_1_cidr = "10.0.3.0/24"
  private_subnet_2_cidr = "10.0.4.0/24"
  private_subnet_3_cidr = "10.0.5.0/24"
  private_subnet_4_cidr = "10.0.6.0/24"
  private_subnet_5_cidr = "10.0.7.0/24"
  private_subnet_6_cidr = "10.0.8.0/24"
  region                = "us-east-1"
}

module "bastion" {
  source            = "../../modules/bastion"
  ami               = "ami-0d27e0fb3bac4d724"
  instance_type     = "t2.micro"
  key_name          = "us-east-1-key"
  subnet_id         = module.vpc.public_subnet_1_id
  security_group_id = module.vpc.default_security_group_id
  vpc_id            = module.vpc.vpc_id
}

module "frontend-ec2" {
  source = "../../modules/frontend/ec2"

  aws_region     = "us-east-1"
  ami            = "ami-0d27e0fb3bac4d724"
  instance_type  = "t2.micro"
  key_name       = "us-east-1-key"
  subnet_id      = module.vpc.public_subnet_1_id
  frontend_sg_id = module.vpc.frontend_server_sg_id
  vpc_id         = module.vpc.vpc_id
}

module "backend-ec2" {
  source            = "../../modules/backend/ec2"
  project_name      = "full-stack-project"
  ami_id            = "ami-0d27e0fb3bac4d724"
  instance_type     = "t2.micro"
  key_name          = "us-east-1-key"
  subnet_id         = module.vpc.private_subnet_1_id
  security_group_id = module.vpc.backend_server_sg_id
  vpc_id            = module.vpc.vpc_id
}

module "frontend-alb" {
  source            = "../../modules/frontend/Load-balancer-Frontend"
  project_name      = "full-stack-project"
  alb_name          = "frontend-alb"
  target_group_name = "frontend-tg"
  subnets           = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
  security_group_id = module.vpc.frontend_alb_sg_id
  vpc_id            = module.vpc.vpc_id
}

module "backend-alb" {
  source            = "../../modules/backend/Load-balancer-Backend"
  project_name      = "full-stack-project"
  alb_name          = "backend-alb"
  target_group_name = "backend-tg"
  subnet_ids        = [module.vpc.private_app_subnets[0], module.vpc.private_app_subnets[1]]
  backend_sg_id     = module.vpc.backend_alb_sg_id
  vpc_id            = module.vpc.vpc_id
}

module "rds" {
  source            = "../../modules/database"
  project_name      = "three-tier"
  identifier        = "book-rds"
  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  multi_az          = false
  db_name           = "bookdb"
  db_username       = "admin"
  db_password       = var.db_password
  ami_id            = "ami-0d27e0fb3bac4d724"
  vpc_id            = module.vpc.vpc_id
  db_subnet_1_id    = module.vpc.private_db_subnets[0]
  db_subnet_2_id    = module.vpc.private_db_subnets[1]
  rds_sg_id         = module.vpc.database_sg_id
}

module "frontend_launchtemplate" {
  source = "../../modules/frontend/launch-template"

  project_name   = "three-tier"
  instance_id    = module.frontend-ec2.frontend_instance_id
  instance_type  = "t3.micro"
  frontend_sg_id = module.vpc.frontend_server_sg_id
  key_name       = "us-east-1-key"
}

module "backend_launchtemplate" {
  source = "../../modules/backend/launch-template"

  project_name  = "three-tier"
  instance_id   = module.backend-ec2.backend_instance_id
  instance_type = "t3.micro"
  backend_sg_id = module.vpc.backend_server_sg_id
  key_name      = "us-east-1-key"
}

module "asg-backend" {
  source = "../../modules/backend/asg"

  project_name               = "three-tier"
  backend_launch_template_id = module.backend_launchtemplate.backend_launch_template_id
  app_subnet_1               = module.vpc.private_app_subnets[0]
  app_subnet_2               = module.vpc.private_app_subnets[1]
  backend_target_group_arn   = module.backend-alb.alb_target_group_arn
  desired_capacity           = 1
  min_size                   = 1
  max_size                   = 3
  scale_out_target_value     = 80
}

module "asg-frontend" {
  source = "../../modules/frontend/asg"

  project_name                = "three-tier"
  frontend_launch_template_id = module.frontend_launchtemplate.frontend_launch_template_id
  web_subnet_1                = module.vpc.public_subnets[0]
  web_subnet_2                = module.vpc.public_subnets[1]
  frontend_target_group_arn   = module.frontend-alb.alb_target_group_arn
  frontend_desired_capacity   = 1
  frontend_min_size           = 1
  frontend_max_size           = 3
  scale_out_target_value      = 80
}
