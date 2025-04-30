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

resource "aws_key_pair" "server-key" {
  key_name   = "server-key-userX"
  public_key = file(var.public_key)
}

resource "aws_instance" "my_ec2_4" {
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  ami = var.aws_amis[var.aws_region]
  instance_type = var.instance_type
  key_name = aws_key_pair.server-key.key_name
  user_data = "${file("install_apache.sh")}"

  provisioner "local-exec" {
    command = "echo ${aws_instance.my_ec2_4.public_ip} > ip_addr.txt"
  }

  provisioner "remote-exec" {
    inline = [
    "sudo apt-get -y update",
    "sudo apt-get install -y apache2"
    ]
  }

  connection {
    type        = "ssh"
    user        = "admin"
    private_key = file(var.private_key)
    host        = self.public_ip
  }

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
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

