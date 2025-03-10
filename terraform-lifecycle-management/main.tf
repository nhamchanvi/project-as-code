# main.tf - Example Terraform Configuration

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3"
}

# Create a Security Group
# resource "aws_security_group" "allow_ssh" {
#   description = "Allow SSH inbound traffic"
#   ingress {
#     description = "SSH from anywhere"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "allow-ssh"
#   }
# }

# Create an EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0076ac74e7710cd06"
  instance_type = "t3.micro"
  # vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "HelloWorld"
  }
}

# Output the Public IP of the EC2 Instance
output "public_ip" {
  value = aws_instance.web.public_ip
}
