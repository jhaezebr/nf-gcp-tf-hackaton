resource "google_storage_bucket" "demo_bucket" {
  # Required arguments for bucket creation
  name = "${var.gcp_project_name}-tf-demo-bucket"
  location = var.gcp_region

  # Some examples of optional arguments
  project = var.gcp_project_name
  autoclass {
    enabled = true
  }
  soft_delete_policy {
    retention_duration_seconds = 0
  }

  force_destroy = true
  uniform_bucket_level_access = true
  public_access_prevention = "enforced"

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}


