module "org_administrators" {
  source  = "./modules/org_admin"
  org_id  = data.google_organization.mervinhemaraju.org_id
  members = ["serviceAccount:${google_service_account.github.email}"]
}

module "owners" {
  source = "./modules/owners"
  org_id = data.google_organization.mervinhemaraju.org_id
  members = [
    "user:mervinhemaraju16@gmail.com",
    "user:superadmin@mervinhemaraju.com"
  ]
}
