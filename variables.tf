variable "project_name" {
  description = "Project name prefix for tagging and naming"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "vpc_cidrs" {
  description = "CIDR blocks for each VPC"
  type = map(string)
}
