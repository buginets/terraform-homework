variable vpc_comp {
    type = list(object({
        cidr_block = string
        enable_dns_s = bool
        enable_dns_h = bool
    }))

default = [
    {
    cidr_block = "10.0.0.0/16"
     enable_dns_s = true
     enable_dns_h = true
     },
    
]

}

variable subnet_comp {
    type = list(object({
        cidr_block = list(string)
        a_z = list(string)
        publicIP = list(bool)
        tags = list(map(string))
    }))


    default = [
        {
            cidr_block = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
            a_z = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d"] 
            publicIP = [true, false ]
            tags = [{Name ="Public1"}, {Name = "Public2"}, {Name = "Private1"}, {Name = "Private2"}, ]
        },
        
       
        
        
    ]
}

variable igw_name {
   default = "Hello" 
  
}

variable rt {
    type = list(string)
    default = ["public-rt", "private-rt"]
}

variable sg {
    type = list(number)
    default = [22, 80, 443, 3306]
}

variable ec2 {
  type = list(object({
    ami  = string
    type = string
    
  }))
  default = [
    {
    ami  = "ami-00a929b66ed6e0de6"
    type = "t2.micro"
    }, 
    {
    ami  = "ami-0f9de6e2d2f067fca"
    type = "t2.micro"
    }
  ]
}