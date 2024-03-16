variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched"
}

variable "security_groups" {
  description = "List of security group names to associate with the EC2 instance"
  type        = list(string)
}

variable "user_data" {
  description = "The user data script to be executed on the EC2 instance"
}