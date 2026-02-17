terraform {

  cloud {
    organization = "weigand-hcp"
    hostname     = "app.terraform.io"

    workspaces {
      name = "monorepo-example"
    }
  }

  required_providers {
    tfe = {
      version = "~> 0.0"
    }
  }
}

variable "org" {
  type    = string
  default = "weigand-hcp"
}

data "tfe_organization" "this" {
  name = var.org
}

data "tfe_github_app_installation" "jweigand" {
  name = "jweigand"
}

resource "tfe_project" "monorepo" {
  name         = "monorepo-example"
  organization = data.tfe_organization.this.name
}

resource "tfe_workspace" "onboarding_dev_us_east_1" {
  organization          = data.tfe_organization.this.name
  project_id            = tfe_project.monorepo.id
  name                  = "account-onboarding-dev-us-east-1"
  allow_destroy_plan    = true
  auto_apply            = true
  queue_all_runs        = true
  speculative_enabled   = true
  working_directory     = "account-onboarding-dev/us-east-1"
  file_triggers_enabled = true
  trigger_patterns      = ["/account-onboarding-dev/us-east-1/*", "/modules/asg/*"] # https://developer.hashicorp.com/terraform/cloud-docs/workspaces/settings/vcs#glob-patterns-for-automatic-run-triggering
  terraform_version     = "~> 1.0"
  vcs_repo {
    identifier                 = "jweigand/terraform-monorepo-example"
    github_app_installation_id = data.tfe_github_app_installation.jweigand.id
  }
}

resource "tfe_workspace" "services_dev_global" {
  organization          = data.tfe_organization.this.name
  project_id            = tfe_project.monorepo.id
  name                  = "account-services-dev-global"
  allow_destroy_plan    = true
  auto_apply            = true
  queue_all_runs        = true
  speculative_enabled   = true
  working_directory     = "account-services-dev/global"
  file_triggers_enabled = true
  trigger_patterns      = ["/account-services-dev/global/*", "/modules/**/*"]
  terraform_version     = "~> 1.0"
  vcs_repo {
    identifier                 = "jweigand/terraform-monorepo-example"
    github_app_installation_id = data.tfe_github_app_installation.jweigand.id
  }
}

resource "tfe_workspace" "services_dev_us_east_1" {
  organization          = data.tfe_organization.this.name
  project_id            = tfe_project.monorepo.id
  name                  = "account-services-dev-us-east-1"
  allow_destroy_plan    = true
  auto_apply            = true
  queue_all_runs        = true
  speculative_enabled   = true
  working_directory     = "account-services-dev/us-east-1"
  file_triggers_enabled = true
  trigger_patterns      = ["/account-services-dev/us-east-1/*", "/modules/alb/*"]
  terraform_version     = "~> 1.0"
  vcs_repo {
    identifier                 = "jweigand/terraform-monorepo-example"
    github_app_installation_id = data.tfe_github_app_installation.jweigand.id
  }
}

resource "tfe_workspace" "services_prod_global" {
  organization          = data.tfe_organization.this.name
  project_id            = tfe_project.monorepo.id
  name                  = "account-services-prod-global"
  allow_destroy_plan    = true
  auto_apply            = true
  queue_all_runs        = true
  speculative_enabled   = true
  working_directory     = "account-services-prod/global"
  file_triggers_enabled = true
  trigger_patterns      = ["/account-services-prod/global/*", "/modules/**/*"]
  terraform_version     = "~> 1.0"
  vcs_repo {
    identifier                 = "jweigand/terraform-monorepo-example"
    github_app_installation_id = data.tfe_github_app_installation.jweigand.id
  }
}

resource "tfe_workspace" "services_prod_us_east_1" {
  organization          = data.tfe_organization.this.name
  project_id            = tfe_project.monorepo.id
  name                  = "account-services-prod-us-east-1"
  allow_destroy_plan    = true
  auto_apply            = true
  queue_all_runs        = true
  speculative_enabled   = true
  working_directory     = "account-services-prod/us-east-1"
  file_triggers_enabled = true
  trigger_patterns      = ["/account-services-prod/us-east-1/*", "/modules/redis/*"]
  terraform_version     = "~> 1.0"
  vcs_repo {
    identifier                 = "jweigand/terraform-monorepo-example"
    github_app_installation_id = data.tfe_github_app_installation.jweigand.id
  }
}
