
output "associate_public_ip_address" {
    value = aws_instance.app[*].public_ip
  
}
