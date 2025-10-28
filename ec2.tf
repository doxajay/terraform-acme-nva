# Example subnet for Application VPC
resource "aws_subnet" "app_subnet_1" {
  vpc_id                  = aws_vpc.application.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true   # <— add this line
  tags = {
    Name = "${var.project_name}-app-subnet-1"
  }
}
}

# Security Group allowing HTTP/HTTPS
resource "aws_security_group" "nginx_sg" {
  vpc_id = aws_vpc.application.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project_name}-nginx-sg"
  }
}

# NGINX EC2 instance
resource "aws_instance" "nginx" {
    ami           = data.aws_ami.al2023.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.app_subnet_1.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum install nginx -y
              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = {
    Name = "${var.project_name}-nginx"
  }
}
