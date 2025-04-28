resource aws_vpc "group1" {
    cidr_block = "10.0.0.0/16"
}


resource aws_subnet "subnet1" {
    vpc_id = aws_vpc.group1.id
    cidr_block = var.subnet_cidr_bl[0]
    availability_zone = "${var.region[0]}a"
    map_public_ip_on_launch = true

    tags = {
    Name = "Subnet1"
  }
}

resource aws_subnet "subnet2" {
    vpc_id = aws_vpc.group1.id
    cidr_block = var.subnet_cidr_bl[1]
    availability_zone = "${var.region[0]}b"
    map_public_ip_on_launch = true

    tags = {
    Name = "Subnet2"
  }
}

resource aws_subnet "subnet3" {
    vpc_id = aws_vpc.group1.id
   cidr_block = var.subnet_cidr_bl[2]
    availability_zone = "${var.region[0]}c"
    map_public_ip_on_launch = true


    tags = {
    Name = "Subnet3"
  }
}

resource aws_internet_gateway "igw" {
    vpc_id = aws_vpc.group1.id
    
    
    tags = {
    Name = "main"
  }
}


resource aws_route_table "rt" {
    vpc_id = aws_vpc.group1.id
    
     route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.rt.id
}