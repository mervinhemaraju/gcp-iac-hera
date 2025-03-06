resource "google_organization_iam_binding" "project_creator" {
  org_id = var.org_id
  role   = "roles/resourcemanager.projectCreator"

  members = var.members
}

resource "google_organization_iam_binding" "org_admin" {
  org_id = var.org_id
  role   = "roles/resourcemanager.organizationAdmin"

  members = var.members
}

resource "google_organization_iam_binding" "billing_admin" {
  org_id = var.org_id
  role   = "roles/billing.admin"

  members = var.members
}
