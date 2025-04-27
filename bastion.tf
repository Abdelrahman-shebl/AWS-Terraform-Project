resource "aws_instance" "web" {
  ami           = var.AMI
  instance_type = var.size
  subnet_id = aws_subnet.jump.id
  tags = {
    Name = "jump"
  }
  security_groups = [ aws_security_group.private.id ]
  key_name = aws_key_pair.ec2_key.key_name
  associate_public_ip_address = true
  availability_zone = "us-east-1a"
}