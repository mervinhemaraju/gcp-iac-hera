resource "google_service_account" "github" {
  account_id   = "github-wif"
  display_name = "github"
  project      = google_project.this.project_id
}

# Add roles to the GitHub service account
resource "google_project_iam_member" "github_sa_workload_identity_user" {
  project = google_project.this.project_id
  role    = "roles/iam.workloadIdentityUser"
  member  = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/mervinhemaraju/glamu-iac"
}

resource "google_project_iam_member" "github_sa_service_account_admin" {
  project = google_project.this.project_id
  role    = "roles/iam.serviceAccountAdmin"
  member  = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/mervinhemaraju/glamu-iac"
}

# resource "google_organization_iam_member" "github_sa_project_creator" {
#   org_id = data.google_organization.mervinhemaraju.org_id
#   role   = "roles/resourcemanager.projectCreator"
#   member = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/mervinhemaraju/glamu-iac"
# }

# resource "google_organization_iam_member" "github_sa_folder_admin" {
#   org_id = data.google_organization.mervinhemaraju.org_id
#   role   = "roles/resourcemanager.folderAdmin"
#   member = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/mervinhemaraju/glamu-iac"
# }

# resource "google_project_iam_member" "github_sa_firebase_admin" {
#   project = google_project.this.project_id
#   role    = "roles/firebase.admin"
#   member  = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/mervinhemaraju/glamu-iac"
# }

# # Add Organization Administrator role
# resource "google_organization_iam_member" "github_sa_org_admin" {
#   org_id = data.google_organization.mervinhemaraju.org_id
#   role   = "roles/resourcemanager.organizationAdmin"
#   member = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/mervinhemaraju/glamu-iac"
# }

# Create a service account IAM policy binding
resource "google_service_account_iam_binding" "github_workload_identity_binding" {
  service_account_id = google_service_account.github.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/mervinhemaraju/glamu-iac"
  ]
}
