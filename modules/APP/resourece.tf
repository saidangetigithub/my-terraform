resource "aws_launch_template" "foo" {
  name = "${var.env}-${var.component}-template"
  instance_type = "t2.micro"

  key_name = "test"

 
  vpc_security_group_ids = ["sg-12345678"]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }

 # user_data = filebase64("${path.module}/example.sh")
}