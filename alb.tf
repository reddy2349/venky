resource "aws_lb" "venky-lb" {
  name               = "venky-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tf-sg.id]
  subnets            = [aws_subnet.tf-pub-sn-1.id, aws_subnet.tf-pub-sn-2.id]
}
resource "aws_lb_target_group" "target" {
  name     = "target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tf-vpc.id
}

resource "aws_lb_target_group_attachment" "test-ve" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.ec2-public.id
  port             = 80

  depends_on = [
    aws_instance.ec2-public,
  ]
}
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.venky-lb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}
