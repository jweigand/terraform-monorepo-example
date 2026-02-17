terraform {
  required_version = ">= 1.4"
}

module "alb" {
  source = "../../modules/aws/alb"
}

module "asg" {
  source = "../../modules/aws/asg"
}

module "redis" {
  source = "../../modules/aws/redis"
}
