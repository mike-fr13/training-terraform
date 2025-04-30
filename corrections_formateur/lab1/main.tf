module "ec2_instance_1" {
  source = "./modules/ec2_instance"
  instance_type = "t3.micro"
  tags = {
      Name = "vm1"
  }
}
