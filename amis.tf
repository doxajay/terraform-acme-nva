# Fetch the latest Amazon Linux 2023 AMI (x86_64 architecture)
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["137112412989"] # Official Amazon AMI owner

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
