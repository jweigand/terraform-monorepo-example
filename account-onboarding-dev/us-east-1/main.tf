terraform {
  required_version = ">= 1.4"
}

module "alb" {
  source = "../../modules/aws/alb"

  input = "onboarding-dev-alb"
}

output "alb_output" {
  value = module.alb.input
}
