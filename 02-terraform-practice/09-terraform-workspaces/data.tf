data "aws_ami" "daws88-s" {

  owners     = ["973714476881"]
  name_regex = "^Redhat-9.*"

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
}
