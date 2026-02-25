/* variable "instances" {

  default = ["mongodb", "redis"] # # this is example for for_each particularly for toset type

} */

variable "instances" {

  default = {
    mongodb = "t3.micro",
    redis = "t3.small"
  } # # this is example for for_each particularly for tomap type
}

variable "domain_name" {
  default = "daws88-s.online"
}