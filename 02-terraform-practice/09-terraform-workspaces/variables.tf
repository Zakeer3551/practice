variable "name" {
  type    = string
  default = "locals"
}

variable "instance_type" {
  default = {
    dev  = "t3.micro"
    uat  = "t3.small"
    prod = "t3.meduim"
  }
}

/* variable "instance_name" {
    type = string
    default = "${var.name}-${var.environment}" # locals-dev
} */


variable "ec2_tags" {
  default = {
    Name        = "locals-demo"
    Environment = "dev"
  }
}

variable "sg_tags" {
  default = {
    Name = "locals-demo"
  }
}