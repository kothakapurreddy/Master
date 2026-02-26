# Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create Subnet
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# EC2 Instance
resource "aws_instance" "web" {
  count         = 3
  ami           = "ami-0c02fb55956c7d316"  # us-east-1
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public1.id

  tags = {
    Name = "Terraform-Server-${count.index}"
  }
}


