module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpcsb"
  cidr = var.vpc-cidr

  azs             = var.def-azs
  private_subnets = var.priv_subnets
  public_subnets  = var.pub_subnets

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
 
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

# 1 select a cluster template
# 2 configure cluster and make custom vpc
# 3 task defination using fargate with a network mode of our custom vpc task execution role task size task memory and task cpu
# 4 add container name port 80 expose