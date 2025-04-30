variable "aws_region" {
  type = string
  default = "eu-north-1"
  description = "Région par défaut"
}

variable "aws_amis" {
  type = map
}
variable "instance_type" {
  type=string
}
variable "instance_tag" {
  type=string
}

variable "envt_list" {
	type = map(string)
	default = {
		"1" = "Int1"
		"2" = "Int2"
		"3" = "Int3"
	}
}
