resource "aws_vpc" "myvpc" {
  cidr_block           = var.vpccidr
  enable_dns_hostnames = "true"

  tags = {
    Name = "VPC1"
  }
}
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "IGW"
  }
}

resource "aws_route_table" "Public-RT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "Public-RT"
  }
}

resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.myvpc.id

  tags = {

    Name = "Private-RT"
  }
}

resource "aws_route_table_association" "Public-RTA" {
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.Public-RT.id
}

resource "aws_route_table_association" "Private-RTA" {
  subnet_id      = aws_subnet.subnet02.id
  route_table_id = aws_route_table.Private-RT.id
}

resource "aws_security_group" "SGRP" {
  name        = "SGRP"
  description = "Allow  all traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "allow all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]



  }
}