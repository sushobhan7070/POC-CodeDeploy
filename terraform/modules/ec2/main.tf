resource "aws_security_group" "app_sg" {
  name        = "${var.project}-sg"
  description = "Allow SSH, HTTP, and Tomcat"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Tomcat"
    from_port   = 8080
    to_port     = 8080
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
    Name = "${var.project}-sg"
  }
}

resource "aws_instance" "app_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true
  iam_instance_profile = var.iam_instance_profile

  tags = merge(
  {
    Name = "${var.project}-ec2"
    App  = "POC"
  },
  var.comman_tags
)

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable tomcat8.5
              amazon-linux-extras install -y tomcat8.5
              yum install -y httpd
              systemctl enable tomcat
              systemctl start tomcat
              systemctl enable httpd
              systemctl start httpd

              # Install CodeDeploy agent (for later steps)
              yum install -y ruby wget
              cd /home/ec2-user
              wget https://aws-codedeploy-${AWS_REGION}.s3.${AWS_REGION}.amazonaws.com/latest/install
              chmod +x ./install
              ./install auto
              systemctl start codedeploy-agent
              systemctl enable codedeploy-agent
              EOF
}
