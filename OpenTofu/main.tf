resource "aws_vpc" "staging" {
  cidr_block = var.cidr_block
    tags = {
        Name = "New-VPC"
    }
}

resource "aws_subnet" "staging_subnet" {
  vpc_id     = aws_vpc.staging.id
  cidr_block = var.subnet_cidr_block
    tags = {
        Name = "new-subnet"
    }
}