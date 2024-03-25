###########VPC############

resource "aws_vpc" "main_vpc" {
    cidr_block              = "${lookup(var.cidr_ip_block, var.stage)}.0.0/16"
    enable_dns_support      = true
    enable_dns_hostnames    = true
    
    tags = {
        Name = "vpc" 
    }
}

###########NAT############
resource "aws_internet_gateway" "main_gateway" {
    vpc_id = aws_vpc.main_vpc.id
    
    tags = {
        Name = "internet-gateway"
    }
}

# resource "aws_internet_gateway_attachment" "main_attachment_gateway" {
#     vpc_id              = aws_vpc.main_vpc.id
#     internet_gateway_id = aws_internet_gateway.main_gateway.id
# }

############PUBLIC ROUTE TABLE############
resource "aws_route_table" "main_route_table_public" {
    vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route" "main_route_public" {
    route_table_id          = aws_route_table.main_route_table_public.id
    destination_cidr_block  = "0.0.0.0/0"
    gateway_id              = aws_internet_gateway.main_gateway.id
    depends_on              = [aws_route_table.main_route_table_public]
}

############PUBLIC SUBNETS############
resource "aws_subnet" "public_subnet_1" {
    vpc_id              = aws_vpc.main_vpc.id
    cidr_block          = local.public_subnet[0]
    availability_zone   = local.availability_zone[0]
    
    tags = {
        Name = "public-subnet-1"
    }
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id              = aws_vpc.main_vpc.id
    cidr_block          = local.public_subnet[1]
    availability_zone   = local.availability_zone[1]
    
    tags = {
        Name = "public-subnet-2"
    }
}

############PUBLIC SUBNETS ASSOCIATION############
resource "aws_route_table_association" "public_subnet_1_association" {
    subnet_id       = aws_subnet.public_subnet_1.id
    route_table_id  = aws_route_table.main_route_table_public.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
    subnet_id       = aws_subnet.public_subnet_2.id
    route_table_id  = aws_route_table.main_route_table_public.id
}

############PRIVATE SUBNETS############
resource "aws_subnet" "private_subnet_1" {
    vpc_id              = aws_vpc.main_vpc.id
    cidr_block          = local.private_subnet[0]
    availability_zone   = local.availability_zone[0]
    
    tags = {
        Name = "private-subnet-3"
    }
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id              = aws_vpc.main_vpc.id
    cidr_block          = local.private_subnet[1]
    availability_zone   = local.availability_zone[1]
    
    tags = {
        Name = "private-subnet-4"
    }
}

############PRIVATE ROUTE TABLE############
resource "aws_route_table" "main_route_table_private" {
    vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route" "main_route_private" {
    route_table_id          = aws_route_table.main_route_table_private.id
    destination_cidr_block  = "0.0.0.0/0"
    nat_gateway_id          = aws_nat_gateway.main_nat_gateway.id
}

############PRIVATE SUBNETS ASSOCIATION############
resource "aws_route_table_association" "private_subnet_1_association" {
    subnet_id       = aws_subnet.private_subnet_1.id
    route_table_id  = aws_route_table.main_route_table_private.id
}
  
resource "aws_route_table_association" "private_subnet_2_association" {
    subnet_id       = aws_subnet.private_subnet_2.id
    route_table_id  = aws_route_table.main_route_table_private.id
}

############NAT############
resource "aws_nat_gateway" "main_nat_gateway" {
    allocation_id   = aws_eip.main_eip.id
    subnet_id       = aws_subnet.public_subnet_1.id
    
    tags = {
        Name = "nat-gateway"
    }
}

resource "aws_eip" "main_eip" {
    depends_on = [aws_internet_gateway.main_gateway]
    tags = {
        Name = "eip"
    }
}

resource "aws_security_group" "main_security_group" {
    vpc_id = aws_vpc.main_vpc.id
    
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["${lookup(var.cidr_ip_block, var.stage)}.0.0/20"]
    
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["${lookup(var.cidr_ip_block, var.stage)}.0.0/20"]
    }
}
