module "alb" {
  source  = "terraform-aws-modules/alb/aws"

  name = var.alb-name

  load_balancer_type = var.lb-type

  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets
  security_groups    = [aws_security_group.lb.id]


  target_groups = [
    {
      name_prefix      = "prac"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "ip"
     
    }
  ]

 
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}