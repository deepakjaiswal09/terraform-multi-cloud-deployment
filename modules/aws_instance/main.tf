resource "aws_instance" "aws_vm" {
  ami           = "ami-0a716d3f3b16d290c"
  instance_type = "t3.micro"

  user_data =  <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y nginx
    systemctl enable nginx
    systemctl start nginx
    echo "Hello from AWS Cloud via Terraform" > /var/www/html/index.html
  EOF

  tags = {
    Name = "aws-nginx-server"
  }
}

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "bucket-tf-state-244"
}
