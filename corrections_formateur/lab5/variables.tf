variable "region" {}
variable "env" {
  type = map
  default = {
    "server-1" = "test"
    "server-2" = "dev"
  }
}
