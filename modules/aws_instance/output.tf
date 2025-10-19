output "public_ip" {
  description = "AWS Instance Public IP"
  value       = aws_instance.aws_vm.public_ip
}
