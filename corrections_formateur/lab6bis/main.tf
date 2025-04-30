resource "aws_instance" "my_ec2" {
  ami = var.amis[var.region]
  instance_type = "t3.micro"
  tags = {
      Name = "${terraform.workspace == "prod" ? "prod-ec2" : "default-ec2"}"
      Env = "${terraform.workspace == "prod" ? "PROD" : "DEV"}"
      PROJECT = "${terraform.workspace == "prod" ? "PROD" : "DEV"}"
  }
}
