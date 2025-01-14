output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2_instance.id
}

output "public_ip_Netflix_Jenkins_server" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}

output "public_ip_monitoring" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.Monitoring-Server.public_ip
  
}

output "private_key_filename" {
  description = "The filename of the generated private key"
  value       = local_file.private_key.filename
}
