
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] 
}




resource "aws_instance" "project" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.inst_type[0]
  key_name = aws_key_pair.prj-key.key_name
  subnet_id = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.project-sg.id]

}

output ec2_public_ip {
  
  value = aws_instance.project.public_ip
  
}
