variable "subnet_id" {
  description = "Public subnet ID for EC2"
  type        = string
}

variable "ec2_sg_id" {
  description = "Security group for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}