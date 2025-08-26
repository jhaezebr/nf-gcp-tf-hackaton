locals {
    vpc_SA_roles = toset([
        "roles/batch.jobsEditor",
        "roles/batch.agentReporter",
        "roles/storage.objectUser",
    ])
    vpc_SA = {
      email = "244955359584-compute@developer.gserviceaccount.com"
      scopes = toset(["cloud-platform", "compute-rw", "storage-full"])
    }
}

resource "google_project_iam_member" "vcp_SA_roles" {
  for_each = local.vpc_SA_roles
  project  = data.google_project.project.name
  role     = each.value
  member   = "serviceAccount:${local.vpc_SA.email}"
}
