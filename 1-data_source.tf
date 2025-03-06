#  Get the organization domain
data "google_organization" "mervinhemaraju" {
  domain = var.organization_name
}

# Get the main billing account
data "google_billing_account" "this" {
  display_name = var.organization_name
  open         = true
}
