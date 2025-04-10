resource "aws_instance" "Linux" {
  ami           = var.ec2[0].ami
  instance_type = var.ec2[0].type
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]

  
}
resource "aws_instance" "Ubuntu" {
  ami           = var.ec2[1].ami
  instance_type = var.ec2[1].type
  subnet_id = aws_subnet.private1.id

}