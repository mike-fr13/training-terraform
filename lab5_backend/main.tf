terraform {
  backend "s3" {
    bucket = "bucket-user-10-yti"
    key = "TF-state-user-10"
    region = "eu-north-1"
  }
}

resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "vpc-10"
  }
}

module "ec2_instance_1" {
  source = "./module/ec2"
  for_each = var.envt_list
  ec2_instance_type = "t3.micro"
  ec2_instance_tag = "MonTag"
  ec2_aws_region="eu-north-1"
  ec2_aws_amis=var.aws_amis
  ec2_name="ec2_${each.key}" 
  ec2_security_group_ids=[module.sec_group_1.security_group_id]
}


module "sec_group_1" {
  name        = "sec_group_1_name"
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"

  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_rules            = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}


#resource "aws_security_group" "sec_group_1" {
#    name = "sec_group_1"
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
#   }
#}

