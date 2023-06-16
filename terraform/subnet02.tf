subnet02.tf
resource "aws_subnet" "subnet02" {
vpc_id = aws_vpc.myvpc.id
cidr_block = "10.8.5.0/24"

tags = {
Name = "PrivateSubnet02"
}
}