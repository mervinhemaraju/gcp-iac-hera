resource "google_service_account" "github" {
  account_id   = "github-wif"
  display_name = "github"
  project      = google_project.this.project_id
}
