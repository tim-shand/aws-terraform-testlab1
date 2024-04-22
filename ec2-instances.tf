// Define VM configuration.
resource "aws_instance" "test-vm" {
  count = 3
  ami = data.aws_ami.ubuntu.id
  metadata_options {
    http_tokens = "required"
  }
  instance_type = var.instance_type
  #instance_state = "stopped" #running
  root_block_device {
    encrypted = true
  }
  tags = {
    Name = "test-vm-0${count.index}"
  }
  subnet_id = aws_subnet.test-subnet-01.id
  private_ip = "10.0.50.1${count.index}"
}
