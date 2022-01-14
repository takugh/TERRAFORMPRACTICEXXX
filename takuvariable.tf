
# the varible name could be anything e.g myvpcecidr or cidr_vpc as below
# if the varible didn't have the cidr_block value of "10.0.0.0/16", it
# will still work since we have the .tfvars answer. In case
# the .tfvar value is not present and no value for the
# variable, to code will fail

variable "cidr_vpc" {
    type = string
    default = "10.0.0.0/16"
  
}

variable "cidr_subnet" {
    type = string
    default = "10.0.1.0/24"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "ami_id" {
    type = string
    default = "ami-01cc34ab2709337aa"
  
}