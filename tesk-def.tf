data "template_file" "myapp" {
  template = file("./temp/myapp.json.tpl")

  vars = {
    app_image      = var.app_image
    app_port       = var.app_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region
  }
}

resource "aws_ecs_task_definition" "app" {
  family                   = var.task-def-fam
#   execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = var.nat_mode_task_def
  requires_compatibilities = var.comp_req
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.myapp.rendered
}