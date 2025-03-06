
# Create Owner role binding
resource "google_organization_iam_binding" "owner" {
  org_id  = var.org_id
  role    = "roles/owner"
  members = var.members
}

# Create Billing Administrator role binding
resource "google_organization_iam_binding" "billing_admin" {
  org_id  = var.org_id
  role    = "roles/billing.admin"
  members = var.members
}

# Create Organization Administrator role binding
resource "google_organization_iam_binding" "org_admin" {
  org_id  = var.org_id
  role    = "roles/resourcemanager.organizationAdmin"
  members = var.members
}

# Create Organization Policy Administrator role binding
resource "google_organization_iam_binding" "org_policy_admin" {
  org_id  = var.org_id
  role    = "roles/orgpolicy.policyAdmin"
  members = var.members
}
