module "github_source" {
  source = "github.com/bachureddy/Terraform/Day-6-modules"
  ami           = "ami-0d27e0fb3bac4d724"
  instance_type = "t2.medium"
  vpc_cidr_block = "10.0.0.0/16"
}