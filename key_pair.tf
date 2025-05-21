resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2"
 public_key = file("path/to/public_key")
}
