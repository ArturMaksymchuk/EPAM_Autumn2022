
resource "aws_instance" "Ubuntu" {
    ami = "ami-054e881150baee51a"
    instance_type = "t2.micro"
  tags = {
    Name = "Ubuntu20"
    Owmer = "student"
    Project = "Terraform Intro"
  }
}
resource "aws_instance" "AmazonLinux" {
    ami = "ami-0f15e0a4c8d3ee5fe"
    instance_type = "t2.micro" 
  tags = {
    Name = "AmazonLinux"
    Owmer = "student"
    Project = "Terraform Intro"
  }
}