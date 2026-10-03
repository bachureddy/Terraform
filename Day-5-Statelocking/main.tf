resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "day5-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "day5-subnet"
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0d27e0fb3bac4d724" # Amazon Linux 2 AMI
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.my_subnet.id
  tags = {
    Name = "day5-instance"
  }
}