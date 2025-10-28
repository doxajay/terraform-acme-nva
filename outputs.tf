output "nginx_public_ip" {
  value = aws_eip.nginx_eip.public_ip
}
