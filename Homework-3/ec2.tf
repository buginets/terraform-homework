resource "aws_instance" "ec2-linux" {
  

  ami           = "ami-087f352c165340ea1"  
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public1.id
  
  
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  user_data = file("apache-linux.sh")

  tags = {
    Name = "linux-ec2"
  }
}

resource "aws_instance" "ec2-ubuntu" {
  

  ami           = "ami-075686beab831bb7f"  
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public2.id
  
  
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  user_data = file("apache-ubuntu.sh")

  tags = {
    Name = "ubuntu-ec2"
  }
}