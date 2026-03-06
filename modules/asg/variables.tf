variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "artifact_bucket_name" {
  type = string
}

variable "instance_profile_name" {
  type = string
}
