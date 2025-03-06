resource "google_organization_iam_member" "project_creator" {
  count  = length(var.members)
  org_id = var.org_id
  role   = "roles/resourcemanager.projectCreator"

  member = var.members[count.index]
}

resource "google_organization_iam_member" "org_admin" {
  count  = length(var.members)
  org_id = var.org_id
  role   = "roles/resourcemanager.organizationAdmin"

  member = var.members[count.index]
}

resource "google_organization_iam_member" "billing_admin" {
  count  = length(var.members)
  org_id = var.org_id
  role   = "roles/billing.admin"

  member = var.members[count.index]
}
