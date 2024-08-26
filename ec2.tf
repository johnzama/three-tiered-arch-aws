resource "aws_instance" "web_instance_1" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "Web-Tier-Instance-1"
  }
}

resource "aws_instance" "web_instance_2" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_2.id
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "Web-Tier-Instance-2"
  }
}

# App Tier EC2 Instances
resource "aws_instance" "app_instance_1" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet_1.id
  security_groups = [aws_security_group.app_sg.name]

  tags = {
    Name = "App-Tier-Instance-1"
  }
}

resource "aws_instance" "app_instance_2" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet_2.id
  security_groups = [aws_security_group.app_sg.name]

  tags = {
    Name = "App-Tier-Instance-2"
  }
}

