resource "aws_vpc" "kaizen" {
  cidr_block = var.vpc_comp[0].cidr_block
  enable_dns_support = var.vpc_comp[0].enable_dns_s
  enable_dns_hostnames = var.vpc_comp[0].enable_dns_h
  tags = local.common_tags
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.kaizen.id
  availability_zone = var.subnet_comp[0].a_z[0]
  cidr_block = var.subnet_comp[0].cidr_block[0]
  map_public_ip_on_launch = var.subnet_comp[0].publicIP[0]

  tags = var.subnet_comp[0].tags[0]
}
resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.kaizen.id
  availability_zone = var.subnet_comp[0].a_z[1]
  cidr_block = var.subnet_comp[0].cidr_block[1]
  map_public_ip_on_launch = var.subnet_comp[0].publicIP[0]

  tags = var.subnet_comp[0].tags[1]
}
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.kaizen.id
  availability_zone = var.subnet_comp[0].a_z[2]
  cidr_block = var.subnet_comp[0].cidr_block[2]
  map_public_ip_on_launch = var.subnet_comp[0].publicIP[1]

  tags = var.subnet_comp[0].tags[2]
}
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.kaizen.id
  availability_zone = var.subnet_comp[0].a_z[3]
  cidr_block = var.subnet_comp[0].cidr_block[3]
  map_public_ip_on_launch = var.subnet_comp[0].publicIP[1]

  tags = var.subnet_comp[0].tags[3]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  

  tags = {
    Name = var.rt[0]
  }
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  

  tags = {
    Name = var.rt[1]
  }
}
resource "aws_route_table_association" "public-a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private-a" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-b" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}