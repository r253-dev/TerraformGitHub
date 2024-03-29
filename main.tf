# Configure the GitHub Provider
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  owner          = "r253-dev"
  write_delay_ms = 1000 # default: 1000(ms)
  read_delay_ms  = 0    # default: 0(ms)
}

# TerraformGitHub
resource "github_repository" "terraform_github_repository" {
  name       = "TerraformGitHub"
  visibility = "public"

  allow_auto_merge       = true  # default: false
  allow_merge_commit     = true  # default: true
  allow_rebase_merge     = false # default: true
  allow_squash_merge     = true  # default: true
  archived               = false # default: false
  delete_branch_on_merge = true  # default: false
}
resource "github_branch_protection" "terraform_github_main" {
  repository_id = github_repository.terraform_github_repository.id
  pattern       = "main"

  required_status_checks {
    strict   = true
    contexts = ["validator_and_formatter"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
  }
  require_conversation_resolution = true
}

# TerraformGCP
resource "github_repository" "terraform_gcp_repository" {
  name       = "TerraformGCP"
  visibility = "public"

  allow_auto_merge       = true  # default: false
  allow_merge_commit     = true  # default: true
  allow_rebase_merge     = false # default: true
  allow_squash_merge     = true  # default: true
  archived               = false # default: false
  delete_branch_on_merge = true  # default: false
}
resource "github_branch_protection" "terraform_gcp_main" {
  repository_id = github_repository.terraform_gcp_repository.id
  pattern       = "main"

  required_status_checks {
    strict   = true
    contexts = ["validator_and_formatter"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
  }
  require_conversation_resolution = true
}

# HelloWorld
resource "github_repository" "hello_world_repository" {
  name        = "HelloWorld"
  description = "Hello World javascript"
  visibility  = "public"

  allow_auto_merge       = true  # default: false
  allow_merge_commit     = true  # default: true
  allow_rebase_merge     = false # default: true
  allow_squash_merge     = true  # default: true
  archived               = false # default: false
  delete_branch_on_merge = true  # default: false
}
resource "github_branch_protection" "hello_world_main" {
  repository_id = github_repository.hello_world_repository.id
  pattern       = "main"

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
  }
  require_conversation_resolution = true
}

# ReactTemplate
resource "github_repository" "react_template_repository" {
  name       = "ReactTemplate"
  visibility = "public"

  allow_auto_merge       = true  # default: false
  allow_merge_commit     = true  # default: true
  allow_rebase_merge     = false # default: true
  allow_squash_merge     = true  # default: true
  archived               = false # default: false
  delete_branch_on_merge = true  # default: false
}
resource "github_branch_protection" "react_template_production" {
  repository_id = github_repository.react_template_repository.id
  pattern       = "production"

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
  }
  require_conversation_resolution = true
}
resource "github_branch_protection" "react_template_develop" {
  repository_id = github_repository.react_template_repository.id
  pattern       = "develop"

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
  }
  require_conversation_resolution = true
}

# NestJSTemplate
resource "github_repository" "nestjs_template_repository" {
  name       = "NestJSTemplate"
  visibility = "public"

  allow_auto_merge       = true  # default: false
  allow_merge_commit     = true  # default: true
  allow_rebase_merge     = false # default: true
  allow_squash_merge     = true  # default: true
  archived               = false # default: false
  delete_branch_on_merge = true  # default: false
}
resource "github_branch_protection" "nestjs_template_production" {
  repository_id  = github_repository.nestjs_template_repository.id
  pattern        = "production"
  enforce_admins = true

  required_status_checks {
    strict   = true
    contexts = ["lint (ubuntu-20.04, 20.11.1)", "test (ubuntu-20.04, 20.11.1)"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
    pull_request_bypassers     = ["/r253hmdryou"]
  }
  require_conversation_resolution = true
}
resource "github_branch_protection" "nestjs_template_develop" {
  repository_id  = github_repository.nestjs_template_repository.id
  pattern        = "develop"
  enforce_admins = true

  required_status_checks {
    strict   = true
    contexts = ["lint (ubuntu-20.04, 20.11.1)", "test (ubuntu-20.04, 20.11.1)"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
    pull_request_bypassers     = ["/r253hmdryou"]
  }
  require_conversation_resolution = true
}
