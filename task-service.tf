resource "aws_ecs_service" "ngin-serv" {
  name            = var.ser_name
  cluster         = aws_ecs_cluster.nginx-cluster.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.ser_desired_count
  launch_type = var.ser_launch_type
  

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = module.vpc.private_subnets
  }


  load_balancer {
    target_group_arn = module.alb.target_group_arns[0]
    container_name   = var.container_name
    container_port   = var.app_port
    
  }

}