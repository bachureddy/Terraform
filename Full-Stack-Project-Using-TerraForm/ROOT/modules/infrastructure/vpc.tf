# This file defines the main VPC for the three-tier architecture.

#VPC for the three-tier architecture

resource "aws_vpc" "three_tier" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Public subnets

resource "aws_subnet" "pub1"{
  vpc_id     = aws_vpc.three_tier.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = var.availability_zone_1a
 map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-subnet-1"
  }
}

# Additional public subnets can be defined similarly
resource "aws_subnet" "pub2"{
  vpc_id     = aws_vpc.three_tier.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = var.availability_zone_1b
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-subnet-2"
  }
}

# private web subnets

resource "aws_subnet" "prvt1"{
  vpc_id     = aws_vpc.three_tier.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = var.availability_zone_1a
  tags = {
    Name = "${var.vpc_name}-private-subnet-1"
  }
}

resource "aws_subnet" "prvt2"{
  vpc_id     = aws_vpc.three_tier.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = var.availability_zone_1b
  tags = {
    Name = "${var.vpc_name}-private-subnet-2"
  }
}

# private app subnets

resource "aws_subnet" "prvt3"{
  vpc_id     = aws_vpc.three_tier.id
  cidr_block = var.private_subnet_3_cidr
  availability_zone = var.availability_zone_1a
  tags = {
    Name = "${var.vpc_name}-private-subnet-3"
  }
}

resource "aws_subnet" "prvt4"{
  vpc_id     = aws_vpc.three_tier.id
  cidr_block = var.private_subnet_4_cidr
  availability_zone = var.availability_zone_1b
  tags = {
    Name = "${var.vpc_name}-private-subnet-4"
  }
}

# private database subnets

resource "aws_subnet" "prvt5"{
  vpc_id     = aws_vpc.three_tier.id
  cidr_block = var.private_subnet_5_cidr
  availability_zone = var.availability_zone_1a
  tags = {
    Name = "${var.vpc_name}-private-subnet-5"
  }
}

resource "aws_subnet" "prvt6"{
  vpc_id     = aws_vpc.three_tier.id
  cidr_block = var.private_subnet_6_cidr
  availability_zone = var.availability_zone_1b
  tags = {
    Name = "${var.vpc_name}-private-subnet-6"
  }
}

# internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.three_tier.id

  tags = {
    Name = "${var.vpc_name}-main-igw"
  }
}

# route table for public subnets

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.three_tier.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

# associate public subnets with the public route table
resource "aws_route_table_association" "pub1" {
  subnet_id      = aws_subnet.pub1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "pub2" {
  subnet_id      = aws_subnet.pub2.id
  route_table_id = aws_route_table.public.id
}

# Nat gateway

resource "aws_eip" "nat_eip" {}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id    = aws_subnet.pub1.id
  connectivity_type = "public"
  tags = {
    Name = "${var.vpc_name}-main-nat"
  }
}


# route table for private subnets using the NAT gateway

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.three_tier.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

# table associations for private subnets

resource "aws_route_table_association" "prvt1" {
  subnet_id      = aws_subnet.prvt1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "prvt2" {
  subnet_id      = aws_subnet.prvt2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "prvt3" {
  subnet_id      = aws_subnet.prvt3.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "prvt4" {
  subnet_id      = aws_subnet.prvt4.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "prvt5" {
  subnet_id      = aws_subnet.prvt5.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "prvt6" {
  subnet_id      = aws_subnet.prvt6.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_security_group" "database" {
  name        = "${var.vpc_name}-database-sg"
  description = "Security group for RDS"
  vpc_id      = aws_vpc.three_tier.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.backend_server.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-database-sg"
  }
}

resource "aws_security_group" "frontend_alb" {
  name        = "${var.vpc_name}-frontend-alb-sg"
  description = "Allow public HTTP traffic to the frontend load balancer"
  vpc_id      = aws_vpc.three_tier.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "${var.vpc_name}-frontend-alb-sg"
  }
}

resource "aws_security_group" "frontend_server" {
  name        = "${var.vpc_name}-frontend-server-sg"
  description = "Security group for frontend servers"
  vpc_id      = aws_vpc.three_tier.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.frontend_alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-frontend-server-sg"
  }
}

resource "aws_security_group" "backend_alb" {
  name        = "${var.vpc_name}-backend-alb-sg"
  description = "Allow HTTP traffic from frontend servers to the internal backend load balancer"
  vpc_id      = aws_vpc.three_tier.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.frontend_server.id]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "${var.vpc_name}-backend-alb-sg"
  }
}

resource "aws_security_group" "backend_server" {
  name        = "${var.vpc_name}-backend-server-sg"
  description = "Security group for backend servers"
  vpc_id      = aws_vpc.three_tier.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.backend_alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-backend-server-sg"
  }
}
