terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.48.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_name
  region  = var.gcp_region
}
