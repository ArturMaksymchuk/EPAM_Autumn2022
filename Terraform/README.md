


# Terraform

1. Create instanses


[Linc for main.tf](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/Terraform/main.tf)

<details>
  <summary>Code of main.tf</summary>
  
  ```json

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
  ```
  
</details>

![](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/Terraform/screens/1.png)

2. Destroy instanses
![](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/Terraform/screens/2.png)