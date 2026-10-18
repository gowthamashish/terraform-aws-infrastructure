output "vpc_id" {
  description = "ID of the provisioned Custom VPC"
  value       = aws_vpc.main_vpc.id
}

output "public_subnet_ids" {
  description = "IDs of the Multi-AZ Public Subnets"
  value       = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  description = "IDs of the Multi-AZ Private Subnets"
  value       = aws_subnet.private_subnets[*].id
}

output "docker_ec2_public_ip" {
  description = "Public IP address of the EC2 instance running Docker"
  value       = aws_instance.docker_app_server.public_ip
}