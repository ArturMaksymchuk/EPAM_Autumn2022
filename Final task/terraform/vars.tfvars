



vpc_id              = "vpc-0832dbef0de3818d6"
Instance_type       = "t2.micro"
minsize             = 1
maxsize             = 2
public_subnets     = ["subnet-XXXXXXXXXX", "subnet-XXXXXXXXX"] # Service Subnet
elb_public_subnets = ["subnet-XXXXXXXXXX", "subnet-XXXXXXXXX"] # ELB Subnet
tier = "WebServer"
solution_stack_name = "64bit Amazon Linux 2 v3.5.0 running PHP 8.1"

