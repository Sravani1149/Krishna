resource "aws_vpc" "myvpc" {
cidr_block = var.vpccidr
enable_dns_hostnames = "true"

tags = {
Name = "VPC1"
}
}