#  The main management project
resource "google_project" "this" {
  provider = google.no_user_project_override

  name       = "management"
  project_id = "management"

  org_id          = data.google_organization.mervinhemaraju.org_id
  billing_account = data.google_billing_account.this.id

}
