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
