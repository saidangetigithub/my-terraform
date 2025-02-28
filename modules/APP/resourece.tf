resource "aws_launch_template" "foo" {
  name = "${var.env}-${var.component}-template"
  instance_type = "t2.micro"

  key_name = "test"
   image_id = data.aws_ami.ami.id

 
  vpc_security_group_ids = ["sg-0d812fd8a9008e39d"]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }

 # user_data = filebase64("${path.module}/example.sh")
}



resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-west-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.foo.id
    version = "$Latest"
  }
}