locals {
  # instance_name  = "${var.name}-${var.environment}"
  ec2_final_tags = merge(var.ec2_tags, local.common_tags) # dev in var.ec2_tags gets overriden by prod in local.common_tags
  common_tags = {
    Project     = "roboshop"
    Terraform   = "true"
    Environment = "prod"

  }
  ami_id      = data.aws_ami.daws88-s.id
  environment = terraform.workspace # terraform.workspace is a special varaible you get in terraform workspace
}