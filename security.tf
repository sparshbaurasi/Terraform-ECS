resource "aws_security_group" "lb" {
  name        = var.sg-name-lb
  description = var.sg-desc-lb
  vpc_id      = module.vpc.vpc_id

  ingress {
    protocol    = var.lb-sg-protocol
    from_port   = var.app_port
    to_port     = var.app_port
    cidr_blocks = var.all-traffic-cidr
  }

  egress {
    protocol    = var.egress-protocol
    from_port   = var.egress-op-port
    to_port     = var.egress-op-port
    cidr_blocks = var.all-traffic-cidr
  }
}

# Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "ecs_tasks" {
  name        = var.task-sg-name
  description = var.task-sg-desc
  vpc_id      = module.vpc.vpc_id

  ingress {
    protocol        = var.lb-sg-protocol
    from_port       = var.app_port
    to_port         = var.app_port
    security_groups = [aws_security_group.lb.id]
  }

  egress {
    protocol    = var.egress-protocol
    from_port   = var.egress-op-port
    to_port     = var.egress-op-port
    cidr_blocks = var.all-traffic-cidr
  }
}