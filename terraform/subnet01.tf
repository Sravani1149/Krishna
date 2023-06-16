resource "aws_subnet" "subnet01" {
vpc_id =aws_vpc.myvpc.id
cidr_block = "10.8.2.0/24"

tags = {
Name = "PublicSubnet01"
}
}