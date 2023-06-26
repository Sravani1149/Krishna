resource "aws_subnet" "subnet01" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.subnet01cidr

  tags = {
    Name = "PublicSubnet01"
  }
}