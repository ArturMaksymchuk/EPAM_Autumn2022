resource "aws_instance" "app" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    # subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    key_name = "aws-marturi"
    # public_ip = "true"
}