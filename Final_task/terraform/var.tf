
variable "instance_type" {
        default = "t2.micro"
}

# variable "subnet_id" {
#         description = "The VPC subnet the instance(s) will be created in"
#         default = "subnet-07ebbe60"
# }

variable "ami_id" {
        description = "The AMI of ubuntu20"
        default = "ami-076bdd070268f9b8d"
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 1
}


