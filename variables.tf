variable "vpc-cidr" {
  description="vpc cidr block"
}

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-east-1"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "nginx:latest"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 2
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}


variable "def-azs" {
  description = "default availablity zone"
}
variable "priv_subnets" {
  description = "list of private subnets"
}

variable "pub_subnets" {
  description = "list of public subnets"
}

variable "cluster_name" {
  description = "This is cluster name"
}

variable "task-def-fam" {
  description = "This is task defination's family name"
}

variable "nat_mode_task_def" {
  description = "This is task defination's network mode"
}

variable "comp_req" {
  description = "This is required compatibilities for task defination"
}

variable "ser_name" {
  description = "This is service name"
}

variable "ser_launch_type" {
  description = "This is servive launch type"
}

variable "container_name" {
  description = "This is container name"
}

variable "ser_desired_count" {
 description = "This the number of services we want" 
}

variable "sg-name-lb" {
  description = "This is the name of security group of load balancer"
}

variable "sg-desc-lb" {
  description = "This is the description of security froup of lb"
}

variable "all-traffic-cidr" {
  description = "all traffic"
}

variable "task-sg-name" {
  description = "task security group name"
}

variable "task-sg-desc" {
  description = "task security froup description"
}

variable "lb-sg-protocol" {
  description = "This is the protocol used in sg ingress in lb"  
}

variable "egress-protocol" {
  description = "egress protocol"
}

variable "egress-op-port" {
  description = "egress opening port"
}

variable "tg-name-prefix" {
  description = "name prefix of target group"
}

variable "tg-backend_protocol" {
  description = "backend protocol"
}

variable "tg-target-type" {
  description = "target type"
}

variable "alb-name" {
  description = "alb names"
}

variable "lb-type" {
  description = "load balancer type"
}

variable "tg-index" {
  
}