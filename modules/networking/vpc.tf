###########VPC############
resource "aws_vpc" "main_vpc" {
  cidr_block           = "${lookup(var.cidr_ip_block, var.stage)}.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.stage}-${var.project_name}-vpc"
  }
}

###########INTERNET GATEWAY############
resource "aws_internet_gateway" "main_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.stage}-internet-gateway"
  }
}

############NAT############
resource "aws_nat_gateway" "main_nat_gateway" {
  allocation_id = aws_eip.main_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "${var.stage}-nat-gateway"
  }
}

resource "aws_eip" "main_eip" {
  depends_on = [aws_internet_gateway.main_gateway]
  tags = {
    Name = "${var.stage}-eip"
  }
}
