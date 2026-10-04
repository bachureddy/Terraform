module "dev-2" {
  source        = "../Day-6-modules"
  ami           = "ami-0d27e0fb3bac4d724"
  instance_type = "t2.medium"
  vpc_cidr_block = "10.0.0.0/16"
  tags          = "instance-2"
}