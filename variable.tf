#List variables here
variable "ami_name" {
  type = string
  default = "ami-091138d0f0d41ff90"
}
variable "instance_type" {
  type = list(string)
  default = [ "t3.micro", "t3.small", "t3.medium" ]
}

#Boolean variable
variable "associated_public_ip" {
  type = bool
  default = true
}
 
#String variable
variable "availability_zone" {
  type = string
  default = "us-east-1a"
}

#key-value pair variable
variable "key_name" {
  type = string
  default = "Nik"
}

#security group variable
variable "sg_name" {
  type = string
  default = "terraform-sg"
}

#tag variable
variable "tags" {
  type = map(string)
  default = {
    "Name" = "webserver"
    "Environment" = "Production"
  }
}