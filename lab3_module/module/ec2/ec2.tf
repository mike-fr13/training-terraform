resource "aws_instance" "ec2_name_1" {
  #vpc_security_group_ids = [aws_security_group.instance_sg.id]
  vpc_security_group_ids = var.ec2_security_group_ids
  
  ami = var.ec2_aws_amis[var.ec2_aws_region]
  instance_type = var.ec2_instance_type

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
  EOF	

}

#resource "aws_security_group" "instance_sg" {
#    name = "terraform-test-sg-userr11"
#
#    egress {
#        from_port       = 0
#        to_port         = 0
#        protocol        = "-1"
#        cidr_blocks     = ["0.0.0.0/0"]
#    }
#
#    ingress {
#        from_port   = 80
#        to_port     = 80
#        protocol    = "tcp"
#        cidr_blocks = ["0.0.0.0/0"]
#    }
#}

