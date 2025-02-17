resource "aws_instance" "frontend" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"
  security_groups = "openall"

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "www" {
  zone_id = "Z10344452MLPHOKMJPS3F"
  name    = "frontend.rajasekhar72.store"
  type    = "A"
  ttl     = 30
  records = aws_instance.frontend.private_ip
}