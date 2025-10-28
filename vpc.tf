# Security / Inspection VPC
resource "aws_vpc" "security" {
  cidr_block = var.vpc_cidrs["security"]
  tags = {
    Name = "${var.project_name}-security-vpc"
  }
}

# Application VPC
resource "aws_vpc" "application" {
  cidr_block = var.vpc_cidrs["application"]
  tags = {
    Name = "${var.project_name}-application-vpc"
  }
}

# Management VPC
resource "aws_vpc" "management" {
  cidr_block = var.vpc_cidrs["management"]
  tags = {
    Name = "${var.project_name}-management-vpc"
  }
}
