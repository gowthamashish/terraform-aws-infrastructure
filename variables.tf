variable "aws_region" {
  description = "AWS region to deploy multi-tier infrastructure"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name tag for all AWS resources"
  type        = string
  default     = "multi-tier-aws-infra"
}

variable "vpc_cidr" {
  description = "CIDR block for the custom VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for Public Subnets across multiple AZs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for Private Subnets across multiple AZs"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "availability_zones" {
  description = "Availability Zones in Mumbai region"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "instance_type" {
  description = "EC2 compute instance type running Docker containers"
  type        = string
  default     = "t2.micro"
}