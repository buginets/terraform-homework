resource "aws_vpc" "kaizen" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "kaizen"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.kaizen.id
  availability_zone = "us-west-2a"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public1"
  }
}
resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.kaizen.id
  availability_zone = "us-west-2b"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public2"
  }
}
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.kaizen.id
  availability_zone = "us-west-2c"
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "private1"
  }
}
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.kaizen.id
  availability_zone = "us-west-2d"
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "private2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "homework-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  

  tags = {
    Name = "private-rt"
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