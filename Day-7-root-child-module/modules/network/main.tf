resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_tags
    
  }
}


resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr_block
  tags = {
    Name = var.subnet_tags
  }
}

output "subnet_id" {
  value = aws_subnet.my_subnet.id
}