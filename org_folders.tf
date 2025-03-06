
# Create the main glamu folder
resource "google_folder" "glamu" {
  provider = google.no_user_project_override

  display_name = "glamu"
  parent       = "organizations/${data.google_organization.mervinhemaraju.org_id}"
  # deletion_protection = false
}
