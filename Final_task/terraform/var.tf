variable "instance_type" {
        default = "t2.micro"
}

variable "ami_id" {
        description = "The AMI of AWS instance"
        default = "ami-0c0d3776ef525d5dd"
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 1
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = "aws-app"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = ["sg-0f29f2310b71eae4a"]
}



