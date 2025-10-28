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
# Internet Gateway for the Application VPC
resource "aws_internet_gateway" "app_igw" {
  vpc_id = aws_vpc.application.id
  tags = {
    Name = "${var.project_name}-app-igw"
  }
}

# Public route table for the Application VPC
resource "aws_route_table" "app_public_rt" {
  vpc_id = aws_vpc.application.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app_igw.id
  }
  tags = {
    Name = "${var.project_name}-app-public-rt"
  }
}

# Associate the Application subnet with the public route table
resource "aws_route_table_association" "app_public_assoc" {
  subnet_id      = aws_subnet.app_subnet_1.id
  route_table_id = aws_route_table.app_public_rt.id
}
