resource "aws_security_group" "project-sg" {
  name        = "http-sg"
  description = "Allow http ssh inbound traffic"
  vpc_id = aws_vpc.group1.id
  

  ingress {
    description      = "http"
    from_port        = var.port[0]
    to_port          = var.port[0]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description      = "jenkins"
    from_port        = var.port[1]
    to_port          = var.port[1]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  ingress {
    description      = "ssh"
    from_port        = var.port[2]
    to_port          = var.port[2]
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
    Name = "group-1"
  }
}