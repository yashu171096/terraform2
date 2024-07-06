resource "aws_lb" "alb" {
  name               = "timing-alb"
  internal           = var.internal
  load_balancer_type = var.lb_type
  security_groups    = var.security_groups
  subnets            = var.subnet_ids
idle_timeout = var.timeout

  enable_deletion_protection = true

 /*  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "test-lb"
    enabled = true
  } */

  tags = {
    Environment = "production"
  }
}