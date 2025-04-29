variable "aws_key" {
  default = "Hello-key"
  type    = string
}

variable "region" {
  default = ["us-east-1", "us-east-2", "us-west-1", "us-west-2"]
  type    = list
}

variable "port" {
  default = [80, 8080, 22]
  type    = list
}

variable "subnet_cidr_bl" {
    default = ["10.0.1.0/24","10.0.2.0/24" , "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
    type = list
}

variable "inst_type" {
    default = ["t2.micro", "t2.small", "t2.medium", "t2.large"]
    type = list
}