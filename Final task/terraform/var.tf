variable "elasticapp" {
  default = "my92five"
}
variable "beanstalkappenv" {
  default = "my92fiveenv"
}

 variable "tier" {
  default = "WebServer"
}

 variable "solution_stack_name" {
  default = "64bit Amazon Linux 2018.03 v2.9.11 running PHP 5.4"
}


variable "vpc_id" {
   default = "vpc-0832dbef0de3818d6"
}
variable "public_subnets" {}
variable "elb_public_subnets" {}