// Org Administrators
module "org_administrators" {
  source  = "./modules/iam_org_admin"
  org_id  = data.google_organization.mervinhemaraju.org_id
  members = ["serviceAccount:${google_service_account.github.email}"]
}


// Owners
module "owners" {
  source = "./modules/iam_owners"
  org_id = data.google_organization.mervinhemaraju.org_id
  members = [
    "user:mervinhemaraju16@gmail.com",
    "user:superadmin@mervinhemaraju.com"
  ]
}

resource "google_organization_iam_member" "firebase_admin" {
  org_id = data.google_organization.mervinhemaraju.org_id
  role   = "roles/firebase.admin"
  member = "serviceAccount:${google_service_account.github.email}"
}
