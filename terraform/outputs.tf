output "app_url" {
  value = "http://${aws_instance.ubuntu.public_ip}:80/hello"
}

