###########VPC############
resource "aws_vpc" "main_vpc" {
  cidr_block           = "${lookup(var.cidr_ip_block, var.stage)}.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.stage}-${var.project_name}-vpc"
  }
}

###########NAT############
resource "aws_internet_gateway" "main_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.stage}-internet-gateway"
  }
}

############PUBLIC ROUTE TABLE############
resource "aws_route_table" "main_route_table_public" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.stage}-main-public-route-table"
  }
}

resource "aws_route" "main_route_public" {
  route_table_id         = aws_route_table.main_route_table_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main_gateway.id
  depends_on             = [aws_route_table.main_route_table_public]

}

#TODO add new subet to use in code catalyst test
############PUBLIC SUBNETS############
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.public_subnet[0]
  availability_zone = local.availability_zone[0]

  tags = {
    Name = "${var.stage}-public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.public_subnet[1]
  availability_zone = local.availability_zone[1]

  tags = {
    Name = "${var.stage}-public-subnet-2"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.public_subnet[2]
  availability_zone = local.availability_zone[2]

  tags = {
    Name = "${var.stage}-public-subnet-3"
  }

}

############PUBLIC SUBNETS ASSOCIATION############
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.main_route_table_public.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.main_route_table_public.id
}

resource "aws_route_table_association" "public_subnet_3_association" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.main_route_table_public.id
}

############PRIVATE ROUTE TABLE############
resource "aws_route_table" "main_route_table_private" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.stage}-main-private-route"
  }
}

resource "aws_route" "main_route_private" {
  route_table_id         = aws_route_table.main_route_table_private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main_nat_gateway.id
}

############PRIVATE SUBNETS############
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.private_subnet[0]
  availability_zone = local.availability_zone[0]

  tags = {
    Name = "${var.stage}-private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.private_subnet[1]
  availability_zone = local.availability_zone[1]

  tags = {
    Name = "${var.stage}-private-subnet-2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.private_subnet[2]
  availability_zone = local.availability_zone[2]

  tags = {
    Name = "${var.stage}-private-subnet-3"
  }
}

############PRIVATE SUBNETS ASSOCIATION############
resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.main_route_table_private.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.main_route_table_private.id
}

resource "aws_route_table_association" "private_subnet_3_association" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.main_route_table_private.id
}

############DB PRIVATE SUBNETS############

resource "aws_subnet" "db_private_subnet_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.db_private_subnet[0]
  availability_zone = local.availability_zone[0]

  tags = {
    Name = "${var.stage}-db-private-subnet-1"
  }
}

resource "aws_subnet" "db_private_subnet_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.db_private_subnet[1]
  availability_zone = local.availability_zone[1]

  tags = {
    Name = "${var.stage}-db-private-subnet-2"
  }
}

resource "aws_subnet" "db_private_subnet_3" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.db_private_subnet[2]
  availability_zone = local.availability_zone[2]

  tags = {
    Name = "${var.stage}-db-private-subnet-3"
  }
}

############PRIVATE DB SUBNETS ASSOCIATION############

resource "aws_route_table_association" "db_private_subnet_1_association" {
  subnet_id      = aws_subnet.db_private_subnet_1.id
  route_table_id = aws_route_table.main_route_table_private.id
}

resource "aws_route_table_association" "db_private_subnet_2_association" {
  subnet_id      = aws_subnet.db_private_subnet_2.id
  route_table_id = aws_route_table.main_route_table_private.id
}

resource "aws_route_table_association" "db_private_subnet_3_association" {
  subnet_id      = aws_subnet.db_private_subnet_3.id
  route_table_id = aws_route_table.main_route_table_private.id
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
