resource "aws_instance" "roboshop" { 
  count         = length(var.instances)  
  ami           = var.ami_id 
  instance_type = var.instance_type  
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]

  tags = merge(
    var.common_tags,
    {
      Component = var.instances[count.index] 
      Name = var.instances[count.index] 
    }
  )
}


resource "aws_security_group" "allow_all" {
    name        = var.sg_name  
    description = var.sg_description  
    
    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks 
        ipv6_cidr_blocks = ["::/0"]
    }
     
    tags = merge(
      var.common_tags,
      {
        Name = "allow-all" 
      }
    ) 
} 