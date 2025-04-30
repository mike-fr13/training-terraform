resource "aws_key_pair" "server-key" {
key_name   = "server-key"
public_key = file(var.public_key)
}


resource "aws_instance" "my_ec2_2" {
    ami = var.amis[var.region]
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.instance_sg.id]
    key_name = aws_key_pair.server-key.key_name
    tags = {
        Name = "terraform-debian"
    }
    user_data = <<-EOF
#!/bin/sh
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo echo "<h1>Hello From Terraform</h1>" > /var/www/html/index.html
EOF

}

resource "aws_instance" "my_ec2" {
  ami = var.amis[var.region]
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  tags = {
      Name = "terraform-debian"
  }
  key_name = aws_key_pair.server-key.key_name

  connection {
      type        = "ssh"
      user        = "admin"
      private_key = file("terraform")
      host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2",
      "sudo sh -c 'echo \"Hello From Terraform ....\" > /var/www/html/index.html'",
    ]
  }


provisioner "file" {
source = "index.html" # terraform machine
destination = "/tmp/index.html" # remote machine
}

provisioner "remote-exec" {
    inline = [
      "sudo cp /tmp/index.html /var/www/html/index.html",
    ]
}

  provisioner "local-exec" {
    when        = destroy
    on_failure  = continue
    command = "echo la fin ${self.private_ip} >> private_ips.txt"
  }
}


resource "aws_security_group" "instance_sg" {
    name = "terraform-user11-sg"

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
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

output "public_ip" {
    value = [aws_instance.my_ec2.public_ip]
}
output "public_ip_2" {
    value = [aws_instance.my_ec2_2.public_ip]
}


resource "aws_instance" "my_server11" {
    instance_type                        = "t3.micro"
    ami                                  = "ami-0548d28d4f7ec72c5"

}
