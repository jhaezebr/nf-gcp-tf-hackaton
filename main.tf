data "google_project" "project" {
    project_id = var.gcp_project_name
}

resource "google_project_service" "enable_batch" {
  service = "batch.googleapis.com"
  disable_on_destroy = false
}
