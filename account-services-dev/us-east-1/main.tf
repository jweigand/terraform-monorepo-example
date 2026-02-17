terraform {
  required_version = ">= 1.4"
}

module "redis" {
  source = "../../modules/aws/redis"
}
