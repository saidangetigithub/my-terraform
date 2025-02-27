resource "aws_security_group" "sg" {
  name        = "sg-vpc"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

   ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.alb_sg_cidr]
    
   }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

    }
  tags = {
    Name = "sg-vpc"
  }
}


resource "aws_lb" "publb" {
  name               = "${var.env}-publb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = var.subnets

  
  tags = {
    Environment = "${var.env}-publb"
  }
}


resource "aws_lb" "privlb" {
  name               = "${var.env}-privlb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = var.subnets

  
  tags = {
    Environment = "${var.env}-privlb"
  }
}