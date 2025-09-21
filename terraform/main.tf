provider "aws" {
  region  = var.region
  profile = "<Created Profiles Name>" #create a new profile or use existing on with Ec2FullAccess Policy attached to the IAM User.
}

# Security group for HTTP
resource "aws_security_group" "web_sg" {
  name        = "TE-Assignment1-SG"
  description = "Allow HTTP"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "TE-Assignment1-SG"
  }

}

# EC2 instance
resource "aws_instance" "ubuntu" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "<Name of your Download Key_pair>" #use Your Downloaded keypair's name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = file("../script/user_data.sh")

  tags = {
    Name = "TE-Assignment1-EC2-instance"
  }
}

