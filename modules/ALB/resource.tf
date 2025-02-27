# resource "aws_security_group" "secg" {
#   name        = "openvpc"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = var.vpc_id

#    ingress {
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = [var.alb_sg_cidr]
    
#    }
#     egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]

#     }
#   tags = {
#     Name = "${var.env}-sec"
#   }
# }


# resource "aws_lb" "publb" {
#   name               = "${var.env}-publb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.secg.id]
#   subnets            = var.subnets

  
#   tags = {
#     Environment = "${var.env}-publb"
#   }
#   depends_on = [ aws_security_group.secg ]
# }


resource "aws_lb" "privlb" {
  name               = "${var.env}-privlb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = ["sg-0d812fd8a9008e39d"]
  subnets            = var.subnets

  
  tags = {
    Environment = "${var.env}-privlb"
  }
 # depends_on = [ aws_security_group.secg ]
}