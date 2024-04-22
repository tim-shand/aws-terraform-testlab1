// Instance type (nano, micro etc).
variable "instance_type" {
    type = string
    description = "t2.nano"
    default = "t2.nano"
}

// Get AMI id via lookup, using 'data' as storage object.
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
// Test AWS SSO login status: aws sts get-caller-identity --query "Account" --profile default