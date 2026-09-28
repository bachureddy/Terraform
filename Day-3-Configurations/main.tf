resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "New VPC"
  }
}

resource "aws_subnet" "my_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet_cidr
    tags ={
        Name = "Public Subnet"
    }
}

resource "aws_internet_gateway" "my_ig" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "My Internet Gateway"
    }
}

resource "aws_route_table" "my_rt" {
    vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id
  }
}

resource "aws_route_table_association" "my_rta" {
    subnet_id = aws_subnet.my_subnet.id
    route_table_id = aws_route_table.my_rt.id
}

resource "aws_security_group" "my_sg" {
    name = "my_security_group"
    description = "allow the traffic"
    vpc_id = aws_vpc.my_vpc.id

 ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
 egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    
}
}

resource "aws_instance" "my_instance" {
    ami = "ami-075d448db8fb256af"
    instance_type = var.instance_type
    subnet_id = aws_subnet.my_subnet.id
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    tags = {
        Name = "My EC2 Instance"
    }
}