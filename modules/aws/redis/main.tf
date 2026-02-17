terraform {
  required_version = ">= 1.4"
}

variable "input" {
  default = ""
}

resource "terraform_data" "redis" {
  input = var.input != "" ? var.input : null # sets parameter to null if 'input' variable does not have a value
}

output "input" {
  value = var.input != "" ? var.input : null # sets output to null if 'input' variable does not have a value
}
