
resource "google_iam_workload_identity_pool" "github" {
  workload_identity_pool_id = "github-pool"
  display_name              = "github-pool"
  project                   = google_project.this.project_id
}

resource "google_iam_workload_identity_pool_provider" "github" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-provider"
  display_name                       = "github"
  description                        = "GitHub Actions identity pool provider."
  attribute_condition                = <<EOT
      attribute.repository == "mervinhemaraju/glamu-iac"
  EOT
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
  project = google_project.this.project_id
}
