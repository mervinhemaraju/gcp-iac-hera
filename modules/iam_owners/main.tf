
# Create Owner role binding
resource "google_organization_iam_member" "owner" {
  count  = length(var.members)
  org_id = var.org_id
  role   = "roles/owner"

  member = var.members[count.index]
}

# Create Billing Administrator role binding
resource "google_organization_iam_member" "billing_admin" {
  count  = length(var.members)
  org_id = var.org_id
  role   = "roles/billing.admin"

  member = var.members[count.index]
}

# Create Organization Administrator role binding
resource "google_organization_iam_member" "org_admin" {
  count  = length(var.members)
  org_id = var.org_id
  role   = "roles/resourcemanager.organizationAdmin"

  member = var.members[count.index]
}

# Create Organization Policy Administrator role binding
resource "google_organization_iam_member" "org_policy_admin" {
  count  = length(var.members)
  org_id = var.org_id
  role   = "roles/orgpolicy.policyAdmin"

  member = var.members[count.index]
}
