data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "my_ec2" {
    ami = var.amis[var.region]
    instance_type = var.instance_type
    vpc_security_group_ids = [module.web_sg.security_group_vpc_id]
}

module "web_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  name = "web_sg"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]

}
