variable "ami_id" {   # Variable
    type    = string  # Optional
    default = "ami-09c813fb71547fc4f" # Value # Mandatory
    description = "AMI ID of joindevops RHEL9" # Optional
}

variable "instance_type" {
    default = "t3.micro"     # here type is string
}

variable "ec2_tags" { 
    type    = map(string) # map of string means map lopala strings unnayi
    default = {         # here type is Map 
        Name = "HelloWorld" 
        Purpose = "variables-demo" 
    }
}

variable "sg_name" {
    default = "vars-file-allow-all" 
}

variable "sg_description" {
    default = "allowing all from internet" 
} 

variable "from_port" {
    default = 0 
} 

variable "to_port" { 
    type = number # This is optional
    default = 0 
} 

variable "cidr_blocks" {
    type = list(string)  
    default = ["0.0.0.0/0"] 
} 

variable "sg_tags" {
    type = map(string) 
    default = {
      Name = "allow-all" 
    }
} 

variable "environment" {
    default = "dev"
}
