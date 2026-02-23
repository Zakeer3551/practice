resource "aws_instance" "roboshop" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = ["sg-0999325f6f711dbba"]

    tags = {
        Name = "roboshop"
        Project = "roboshop"
        Environment = "dev" 
        Terraform = "true"
    }
}