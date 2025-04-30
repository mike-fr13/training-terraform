resource "aws_instance" "ec2" {
    ami = "ami-0d31449d0dd5f363f"
    instance_type = "t2.micro"
    for_each = var.env
    tags = {
        Name = "${each.key}"
        Env = "${each.value}"
    }
}
