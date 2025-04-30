variable "aws_region" {
  type = string
  default = "eu-north-1"
  description = "Région par défaut"
}

variable "vpc_suffix" {
  type = string
  description = "vpc suffix"
}

resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "vpc-10-${var.vpc_suffix}"
  }
}
resource "aws_subnet" "subnet-dev-1" {
  vpc_id     = aws_vpc.vpc-dev.id
  cidr_block = "10.10.1.0/24"
}

resource "aws_instance" "my_ec2" {
  ami = var.aws_amis[var.aws_region]
  instance_type = var.instance_type
  tags = {
    Name = var.instance_tag
  }
}
