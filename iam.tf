resource "google_organization_iam_member" "project_creator" {
  org_id = data.google_organization.mervinhemaraju.org_id
  role   = "roles/resourcemanager.projectCreator"
  member = "serviceAccount:${google_service_account.github.email}"
}
