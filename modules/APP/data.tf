data "aws_ami" "ami" {
  most_recent = true
  name_regex = "Amazon Linux 2023 AMI 2023.6.20250218.2 x86_64 HVM kernel-6.1"

  owners = ["311141558545"]
  
}
