
provider "aws" {
  region = "us-east-1"
  profile = "nikhil"
}

# Security Group
resource "aws_security_group" "http" {

  name = var.sg_name

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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
    Name = "var.sg_name"
  }
}

# EC2 Instance
resource "aws_instance" "example" {

  ami = var.ami_name

  instance_type = var.instance_type[0]

  associate_public_ip_address = var.associated_public_ip

  availability_zone = var.availability_zone

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.http.id
  ]

  user_data = <<-EOF
#!/bin/bash
apt update -y
apt install nginx -y
systemctl start nginx
systemctl enable nginx

echo "<h1>Welcome to Terraform</h1>" > /var/www/html/index.html
EOF

  tags = var.tags
}


output "public_ip" {
  value = aws_instance.example.public_ip
}

output "public_dns" {
  value = aws_instance.example.public_dns
}


