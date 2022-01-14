# This is my practice network vpc
resource "aws_vpc" "takutfvpc" {
    cidr_block = var.cidr_vpc # must use the name of the variable after var.
    tags = {
        Name ="takutfvpc"
    }
}

# This is a private subnet
resource "aws_subnet" "prvSN" {
  vpc_id     = aws_vpc.takutfvpc.id
  cidr_block = var.cidr_subnet

  tags = {
    Name = "prvSN"
  }
}


# Bastion instance
resource "aws_instance" "Bastiontf" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = "Baskey"
  subnet_id      = aws_subnet.prvSN.id

  user_data = <<-EOF
              #!/bin/bash 
              yum update -y 
              yum install httpd -y 
              cd /var/www/html 
              echo "JJ Tech Inc Disaster Recovery strategy include using Route53 Failover Based Routing" > index.html 
              service httpd start 
              chkconfig httpd on
              EOF
  tags = {
    Name = "Bastiontf"
  }
}

# the varible name could be anything e.g myvpcecidr or cidr_vpc as below
# if the varible didn't have the cidr_block value of "10.0.0.0/16", it
# will still work since we have the .tfvars answer. In case
# the .tfvar value is not present and no value for the
# variable, to code will fail

# .tfvars must use the name of the variable e.g cidr_vpc
# .tfvar just provide answers the variables


            # takuvariable.tf  file
# variable "cidr_vpc" {
#     type = string
#     default = "10.0.0.0/16"
  
# }

# variable "cidr_subnet" {
#     type = string
#     default = "10.0.1.0/24"
  
# }

# variable "instance_type" {
#     type = string
#     default = "t2.micro"
  
# }

# variable "ami_id" {
#     type = string
#     default = "ami-01cc34ab2709337aa"
  
# }



    #takuvariable.tfvars  file

# cidr_vpc = "125.10.2.0/16"

# cidr_subnet = "125.10.3.0/24"

# instance_type = "t2.nano"

# ami_id = "ami-01cc34ab2709337aa"
