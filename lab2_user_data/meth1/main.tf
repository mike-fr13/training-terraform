variable "aws_region" {
  type = string
  default = "eu-north-1"
  description = "Région par défaut"
}

resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "vpc-10"
  }
}

resource "aws_instance" "my_ec2_2" {
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  ami = var.aws_amis[var.aws_region]
  instance_type = var.instance_type

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
  EOF	

}

resource "aws_security_group" "instance_sg" {
    name = "terraform-test-sg-userr11"

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

