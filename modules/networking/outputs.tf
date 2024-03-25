output "VPC_name" {
    value = aws_vpc.main_vpc.id
}

output "VPC_cidr_block" {
    value = aws_vpc.main_vpc.cidr_block
}

output "public_subnet_1" {
    value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
    value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1" {
    value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
    value = aws_subnet.private_subnet_2.id
}