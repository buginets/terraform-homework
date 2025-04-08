data "aws_ami" "ubuntu" {
  owners = ["099720109477"]
  most_recent      = true
  

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_ami" "linux" {
  owners = ["137112412989"]
  most_recent      = true
  

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}










resource "aws_instance" "ec2-linux" {
  

  ami           = data.aws_ami.linux.id 
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public1.id
  
  
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  user_data = file("apache-linux.sh")

  tags = {
    Name = "linux-ec2"
  }
}

resource "aws_instance" "ec2-ubuntu" {
  

  ami           = data.aws_ami.ubuntu.id  
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public2.id
  
  
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  user_data = file("apache-ubuntu.sh")

  tags = {
    Name = "ubuntu-ec2"
  }
}