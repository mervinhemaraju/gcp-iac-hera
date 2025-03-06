

# The Terraform Module
terraform {

  # The required tf version
  required_version = "1.8.7"

  # Backend configuration
  backend "s3" {
    region = var.bucket_region
    key    = "${var.bucket_key_prefix_iac}/state.tf"
    bucket = var.bucket_name
  }

  # Required providers
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.23.0"
    }
  }
}

# Configure the provider not to use the specified project for quota check.
# This provider should only be used during project creation and initializing services.
provider "google" {
  alias                 = "no_user_project_override"
  user_project_override = false
}

# Configure the provider that uses the new project's quota.
provider "google" {
  user_project_override = true
}
