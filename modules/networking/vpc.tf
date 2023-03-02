###########VPC############

resource "aws_vpc" "main_vpc" {
    cidr_block              = var.cidr_ip_block
    enable_dns_support      = true
    enable_dns_hostnames    = true
    
    tags = {
        Name = "${var.cluster_name}-${var.stage}-vpc"
    }
}

###########NAT############
resource "aws_internet_gateway" "main_gateway" {
    vpc_id = aws_vpc.main_vpc.id
    
    tags = {
        Name = "${var.cluster_name}-${var.stage}-gateway"
    }
}

resource "aws_internet_gateway_attachment" "main_attachment_gateway" {
    vpc_id              = aws_vpc.main_vpc.id
    internet_gateway_id = aws_internet_gateway.main_gateway.id
}

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
    cidr_block          = "${var.ip_subnet_1}/24"
    availability_zone   = "us-west-2a"
    
    tags = {
        Name = "${var.cluster_name}-${var.stage}-subnet-1"
    }
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id              = aws_vpc.main_vpc.id
    cidr_block          = "${var.ip_subnet_2}/24"
    availability_zone   = "us-west-2b"
    
    tags = {
        Name = "${var.cluster_name}-${var.stage}-subnet-2"
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
    cidr_block          = "${var.ip_subnet_3}/24"
    availability_zone   = "us-west-2a"
    
    tags = {
        Name = "${var.cluster_name}-${var.stage}-subnet-3"
    }
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id              = aws_vpc.main_vpc.id
    cidr_block          = "${var.ip_subnet_4}/24"
    availability_zone   = "us-west-2b"
    
    tags = {
        Name = "${var.cluster_name}-${var.stage}-subnet-4"
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
        Name = "${var.cluster_name}-${var.stage}-nat-gateway"
    }
}

resource "aws_eip" "main_eip" {
    vpc = true
    depends_on = [aws_internet_gateway.main_gateway]
    tags = {
        Name = "${var.cluster_name}-${var.stage}-eip"
    }
}
