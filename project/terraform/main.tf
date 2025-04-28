resource "aws_key_pair" "prj-key" {
  key_name   = var.aws_key
  public_key = file("~/.ssh/id_rsa.pub")

  
}


#   vars for tfvars file

# region = ["us-east-1", "us-east-2", "us-west-1", "us-west-2"]

# port = [80, 8080, 22]

# subnet_cidr_bl = ["10.0.1.0/24","10.0.2.0/24" , "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

# inst_type = ["t2.micro", "t2.small", "t2.medium", "t2.large"]