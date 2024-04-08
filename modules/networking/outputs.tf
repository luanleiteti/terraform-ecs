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

output "public_subnet_3" {
    value = aws_subnet.public_subnet_3.id
}

output "private_subnet_1" {
    value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
    value = aws_subnet.private_subnet_2.id
}

output "private_subnet_3" {
    value = aws_subnet.private_subnet_3.id
}

output "db_subnet_1" {
    value = aws_subnet.db_private_subnet_1.id
}

output "db_subnet_2" {
    value = aws_subnet.db_private_subnet_2.id
}

output "db_subnet_3" {
    value = aws_subnet.db_private_subnet_3.id
}


output "public_security_group_id" {
    value = aws_security_group.public_main_security_group.id
}

output "private_security_group_id" {
    value = aws_security_group.private_main_security_group.id
}

output "db_security_group_id" {
    value = aws_security_group.db_main_security_group.id
}

output "alb_security_group_id" {
    value = aws_security_group.alb_main_security_group.id
}