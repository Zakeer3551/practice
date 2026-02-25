resource "aws_instance" "roboshop" {
  ami                    = "ami-0220d79f3f480ecf5"
  count                  = length(var.instances)
  instance_type          = var.instances[count.index] == "mongodb" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = {
    Name        = var.instances[count.index]
    Project     = "roboshop"
    Environment = "dev"
    Terraform   = "true"
  }
}

resource "aws_security_group" "allow-all" {
  name = "allow-internet"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "roboshop"
    Project     = "roboshop"
    Environment = "dev"
    Terraform   = "true"
  }
}