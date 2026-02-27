resource "aws_instance" "example" {
  ami                    = local.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.sg_id

  tags = {
    Name = "${var.project_name}-${var.environment}"

  }
}

