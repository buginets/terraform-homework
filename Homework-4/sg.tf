resource "aws_security_group" "allow_http_ssh" {
  name        = "http-sg"
  description = "Allow http ssh inbound traffic"
  vpc_id = aws_vpc.kaizen.id
  

  ingress {
    description      = "TLS from VPC"
    from_port        = var.sg[0]
    to_port          = var.sg[0]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = var.sg[1]
    to_port          = var.sg[1]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = var.sg[2]
    to_port          = var.sg[2]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = var.sg[3]
    to_port          = var.sg[3]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "http-ssh-sg"
  }
}