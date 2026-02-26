resource "aws_instance" "example" {
  ami                    = local.ami_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory.ini" 
  }

provisioner "local-exec" {
    command = "pwdd"
    on_failure = continue
  }

provisioner "local-exec" {
    when    = destroy
    command = "echo 'Deleting the instance'"
  }

connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

provisioner "remote-exec" {
    inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx" 
    ]
  }

  tags = local.ec2_final_tags
}

resource "aws_security_group" "allow_tls" {
  name        = "allow-all-terraform" # this is for AWS account
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all-terraform"
  }
}



 