region      = "eu-west-1"
instance_type   = "t3.micro"
tag_name        = "user-11"
amis                 = {
  "eu-west-1" = "ami-0d31449d0dd5f363f"
  "eu-west-2" = "ami-0e603d96bf395bc01"
  "eu-west-3" = "ami-0eeeb6788f77d3616"
  "eu-north-1" = "ami-0b27735385ddf20e8"  
}
private_key = "terraform"
public_key = "terraform.pub"
