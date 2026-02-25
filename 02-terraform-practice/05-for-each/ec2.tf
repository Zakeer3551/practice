/* resource "aws_instance" "roboshop" {
  ami                    = "ami-0220d79f3f480ecf5"  
  for_each = toset(var.instances) # this is example for for_each particularly for toset type (list type)
  instance_type          = each.key == "mongodb" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = {
    Name        = each.key
    Project     = "roboshop"
    Environment = "dev"
    Terraform   = "true"
  }
} */

resource "aws_instance" "roboshop" {
  ami                    = "ami-0220d79f3f480ecf5"
  for_each = tomap(var.instances) # this is example for for_each particularly for tomap type (map type)
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = {
    Name        = each.key
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