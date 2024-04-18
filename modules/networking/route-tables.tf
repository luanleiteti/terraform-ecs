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


############DB ROUTE TABLE############
resource "aws_route_table" "main_db_route_table_private" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.stage}-main-db-private-route"
  }
}

############PRIVATE DB SUBNETS ASSOCIATION############
resource "aws_route_table_association" "db_private_subnet_1_association" {
  subnet_id      = aws_subnet.db_private_subnet_1.id
  route_table_id = aws_route_table.main_db_route_table_private.id
}

resource "aws_route_table_association" "db_private_subnet_2_association" {
  subnet_id      = aws_subnet.db_private_subnet_2.id
  route_table_id = aws_route_table.main_db_route_table_private.id
}

resource "aws_route_table_association" "db_private_subnet_3_association" {
  subnet_id      = aws_subnet.db_private_subnet_3.id
  route_table_id = aws_route_table.main_db_route_table_private.id
}
