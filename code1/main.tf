terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
# Create a new GitLab Lightsail Instance
resource "aws_lightsail_instance" "custom" {
  name              = "my_server"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_3_0"
  key_pair_name     = "week7"
  tags = {
    team = "devops"
  }
}
output "my_ip" {
  value = aws_lightsail_instance.custom.public_ip_address
}




