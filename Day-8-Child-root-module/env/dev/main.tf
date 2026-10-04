module "network" {
  source        = "../../modules/network"
  vpc_cidr_block = "10.0.0.0/16"
  vpc_tags        = "VPC"
  subnet_cidr_block = "10.0.1.0/24"
  subnet_tags       = "subnet"
}

module "compute" {
  source        = "../../modules/compute"
  ami           = "ami-0d27e0fb3bac4d724"
  instance_type = "t2.medium"
  subnet_id     = module.network.subnet_id
  instance_tags = {
    Name = "my_instance"
  }
}