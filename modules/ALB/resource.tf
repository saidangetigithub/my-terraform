resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = module.vpc.expense_id

   ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "HTTP"
    cidr_blocks      = [var.alb_sg_cidr]
    
   }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

    }
  tags = {
    Name = "sg"
  }
}


resource "aws_lb" "publb" {
  name               = "${var.env}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = var.subnets

  
  tags = {
    Environment = "${var.env}-lb"
  }
}