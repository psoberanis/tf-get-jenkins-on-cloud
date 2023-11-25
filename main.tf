provider "aws" {
  access_key = "XXXXXXXXXXXXXXXX" ## replace with your access key
  secret_key = "XXXXXXXXXXXXXXXXXXXXX" ## replace with your secret key
  token      = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ## replace with token 
  region     = "us-east-1"
}

resource "aws_instance" "project_demo" {
  ami                    = "ami-06aa3f7caf3a30282" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image build on 2023-10-25
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.demo.id]


  tags = {
    Name = "project1_demo"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y ansible
              git clone https://github.com/javeedsocial/setup-jenkins-ubuntu20.git
              sudo ansible-playbook setup-jenkins-ubuntu20/setup-jenkins.yaml
              EOF

}

resource "aws_security_group" "demo" {
  name        = "demo_sg"
  description = "Demo security group"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 81
    to_port     = 81
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

output "public_ip" {
  value = aws_instance.project_demo.public_ip
}

output "Message" {
  value = "It takes 5mins to setup EC2 and get jenkins ready for you, check on port 8080"
}
