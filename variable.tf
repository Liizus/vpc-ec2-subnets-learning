variable "ec2_public_subnet_name" {
  type = string
}

variable "ec2_private_subnet_name" {
  type = string
}
variable "cidr_addressname" {
  type = list(string)
}

variable "cidr_address_ssh" {
  type = list(string)
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_public_subnet" {
  type = map(object(
    {
      subnet_cidr = string
      subnet_az   = string
      tags        = map(string)
  }))
  default = {
    "us-east-1a" = {
      subnet_cidr = "10.0.0.0/24"
      subnet_az   = "us-east-1a"
      tags = {
        Name = "public-us-east-1a"
      }
    }
    "us-east-1b" = {
      subnet_cidr = "10.0.1.0/24"
      subnet_az   = "us-east-1b"
      tags = {
        Name = "public-us-east-1b"
      }
    }
  }
}

variable "vpc_private_subnet" {
  type = map(object(
    {
      subnet_cidr = string
      subnet_az   = string
      tags        = map(string)
  }))
  default = {
    "us-east-1a" = {
      subnet_cidr = "10.0.16.0/20"
      subnet_az   = "us-east-1a"
      tags = {
        Name = "private-us-east-1a"
      }
    }
    "us-east-1b" = {
      subnet_cidr = "10.0.32.0/20"
      subnet_az   = "us-east-1b"
      tags = {
        Name = "private-us-east-1b"
      }
    }
  }
}