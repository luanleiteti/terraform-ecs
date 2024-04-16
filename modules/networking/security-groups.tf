resource "aws_security_group" "public_main_security_group" {
  vpc_id = aws_vpc.main_vpc.id
  name   = "${var.stage}-ssh-public-security-group"



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.stage}-ssh-public-security-group"
  }
}


resource "aws_security_group" "alb_main_security_group" {
  vpc_id = aws_vpc.main_vpc.id
  name   = "${var.stage}-alb-security-group"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.stage}-alb-security-group"
  }
}



resource "aws_security_group" "private_main_security_group" {
  vpc_id = aws_vpc.main_vpc.id
  name   = "${var.stage}-private-security-group"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_main_security_group.id]

  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_main_security_group.id]

  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.private_subnet[0], local.private_subnet[1], local.private_subnet[2]]
  }

  tags = {
    Name = "${var.stage}-private-security-group"
  }
}


resource "aws_security_group" "db_main_security_group" {
  vpc_id = aws_vpc.main_vpc.id
  name   = "${var.stage}-db-security-group"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.private_main_security_group.id]
  }

  tags = {
    Name = "${var.stage}-db-security-group"
  }
}
