variable "instance_names" {
  default = {
  "web-1" = "us-west-2a" 
  "web-2" = "us-west-2b" 
  "web-3" = "us-west-2c"
  }
}

resource "aws_instance" "ec2" {
  for_each = var.instance_names

  ami           = "ami-03f8acd418785369b"  
  instance_type = "t2.micro"
  availability_zone = each.value
  associate_public_ip_address = true
  key_name = aws_key_pair.bastion.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  user_data = file("apache.sh")

  tags = {
    Name = each.key
  }
}

output "instance_public_ips" {
  value = {
    for name, inst in aws_instance.ec2 :
    name => inst.public_ip
  }
}


#  Outputs:
#  instance_public_ips = {
#  "web-1" = "35.91.90.129"
#  "web-2" = "54.189.150.227"
 # "web-3" = "35.88.91.32"
#}