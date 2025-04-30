variable "ec2_aws_region" {
  type = string
  default = "eu-north-1"
  description = "Région par défaut"
}

variable "ec2_aws_amis" {
  type = map
}
variable "ec2_instance_type" {
  type=string
}
variable "ec2_instance_tag" {
  type=string
}
variable "ec2_name" {
  type=string
}
variable "ec2_security_group_ids" {
  type=list
}
