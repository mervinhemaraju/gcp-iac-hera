resource "google_organization_iam_member" "project_creator" {
  org_id = data.google_organization.mervinhemaraju.org_id
  role   = "roles/resourcemanager.projectCreator"
  member = "serviceAccount:${google_service_account.github.email}"
}

// Existing Project Creator role
resource "google_organization_iam_member" "project_creator" {
  org_id = data.google_organization.mervinhemaraju.org_id
  role   = "roles/resourcemanager.projectCreator"
  member = "serviceAccount:${google_service_account.github.email}"
}

// Organization Administrator role
resource "google_organization_iam_member" "org_admin" {
  org_id = data.google_organization.mervinhemaraju.org_id
  role   = "roles/resourcemanager.organizationAdmin"
  member = "serviceAccount:${google_service_account.github.email}"
}

// Billing Administrator role
resource "google_organization_iam_member" "billing_admin" {
  org_id = data.google_organization.mervinhemaraju.org_id
  role   = "roles/billing.admin"
  member = "serviceAccount:${google_service_account.github.email}"
}

// Folder Administrator role
resource "google_organization_iam_member" "folder_admin" {
  org_id = data.google_organization.mervinhemaraju.org_id
  role   = "roles/resourcemanager.folderAdmin"
  member = "serviceAccount:${google_service_account.github.email}"
}
