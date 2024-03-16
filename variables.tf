variable "ami_id" {
  description = "The ID of the AMI to use for EC2 instances"
}

variable "instance_type" {
  description = "The instance type for EC2 instances"
  default     = "t2.micro"
}

variable "allowed_ips" {
  description = "List of allowed IP addresses for inbound traffic"
  type        = list(string)
  default     = ["1.2.3.4/32", "5.6.7.8/32"]
}

variable "secureweb_ip" {
  description = "The IP address of secureweb.com"
  default     = "secureweb.com"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}