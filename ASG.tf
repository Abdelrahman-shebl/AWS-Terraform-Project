resource "aws_autoscaling_group" "ASG" {
  name                      = "ASG-terraform-test-22"
  max_size                  = 3
  desired_capacity          = 2
  min_size                  = 1
  target_group_arns = [aws_lb_target_group.target_group.arn]
  launch_template {
    id      = aws_launch_template.temp.id
  }
  vpc_zone_identifier       = [aws_subnet.Web1.id, aws_subnet.Web2.id]

  tag {
    key = "Name"
    value = "ASG_instance"
    propagate_at_launch = true
  }

}

resource "aws_launch_template" "temp" {
  name = "temp"
  vpc_security_group_ids = [aws_security_group.private.id]
  image_id = var.AMI
  instance_type = var.size
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  key_name = aws_key_pair.ec2_key.key_name

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ASG instance"
    }
  }

user_data = base64encode(<<-EOF
#!/bin/bash
yum update -y
yum install -y python3
echo "Hello, World from ASG , $(hostname -f) " > /home/ec2-user/index.html
cd /home/ec2-user
python3 -m http.server 80 &
EOF
)
}
