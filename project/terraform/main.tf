resource "aws_key_pair" "prj-key" {
  key_name   = var.aws_key
  public_key = file("~/.ssh/id_rsa.pub")

  
}


#   vars for tfvars file

