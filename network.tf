// Define networking configuration.

// Define VPC - Virtual Private Cloud.
resource "aws_vpc" "test-vpc-01" {
  cidr_block = "10.0.50.0/24"
  tags = {
    Name = "test-vpc-01"
  }
}

// Define Network Subnet. 
resource "aws_subnet" "test-subnet-01" {
  vpc_id            = aws_vpc.test-vpc-01.id // Assign to VPC.
  cidr_block        = "10.0.50.0/24" // Set IP CIDR.
  availability_zone = "ap-southeast-2a" // Different per region. 
  tags = {
    Name = "test-subnet-01"
  }
}

resource "aws_security_group" "sg_test_allow-ssh" {
  name        = "test_inbound_allow-ssh"
  description = "Allow SSH inbound traffic and all outbound traffic."
  vpc_id      = aws_vpc.test-vpc-01.id
  tags = {
    Name = "test_inbound_allow-ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "inrule_test_allow-ssh" {
  security_group_id = aws_security_group.sg_test_allow-ssh.id
  cidr_ipv4         = aws_vpc.test-vpc-01.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "outrule_test_allow-ssh" {
  security_group_id = aws_security_group.sg_test_allow-ssh.id
  cidr_ipv4         = aws_vpc.test-vpc-01.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}