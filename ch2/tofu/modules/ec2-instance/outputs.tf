output "instance_id" {
  description = "the id of the ec2 instance"
  value       = aws_instance.sample_app.id
}

output "security_group_id" {
  description = "the id of the security group"
  value       = aws_security_group.sample_app.id

}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.sample_app.public_ip
}
