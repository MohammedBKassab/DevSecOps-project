variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-005fc0f236362e99f" # Ubuntu 20.04
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.large"
}

variable "key_name" {
  description = "The name of the key pair"
  type        = string
  default     = "Netflix_key"
}

variable "instance_name" {
  description = "The name tag for the EC2 instance"
  type        = string
  default     = "Netflix-EC2"
}
variable "subnet_id" {
 type = string
 default = "subnet-0655034249cb521f7"  
}