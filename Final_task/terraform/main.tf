resource "aws_instance" "app" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    instance_type = "${var.instance_type}"
    key_name             = var.key_name
    associate_public_ip_address = var.associate_public_ip_address
}



