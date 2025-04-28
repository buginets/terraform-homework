variable "aws_key" {
  default = "Hello-key"
  type    = string
}

variable "region" {
  default = ["us-east-1"]
  type    = list
}

variable "port" {
  default = [22, 8080, 80]
  type    = list
}

variable "subnet_cidr_bl" {
    default = ["10.0.1.0/24"]
    type = list
}

variable "inst_type" {
    default = ["t2.micro"]
    type = list
}