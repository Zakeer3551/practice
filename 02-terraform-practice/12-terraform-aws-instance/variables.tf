variable "project_name" {
  type    = string

}

variable "instance_type" {
  type = string
}

variable "environment" {
  type = string
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

variable "ami_id" {
    type = string
  
}
variable "sg_id" {
    type = list
}