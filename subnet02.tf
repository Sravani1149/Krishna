resource "aws_subnet" "subnet02" {
vpc_id = aws_vpc.myvpc.id
cidr_block = var.subnet02cidr

tags = {
Name = "PrivateSubnet02"
}
}