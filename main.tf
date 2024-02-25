# Configure the GitHub Provider
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  owner          = "r253-dev"
  write_delay_ms = 1000 # default: 1000(ms)
  read_delay_ms  = 0    # default: 0(ms)
}

# Create this terraform repository
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
  allows_deletions                = false
  allows_force_pushes             = false
}

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
