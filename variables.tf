variable "gcp_region" {
  type        = string
  description = "The GCP region to apply this config to."
  default     = "europe-west1"
}

variable "gcp_project_name" {
  type        = string
  description = "The GCP project name."
  default     = "qwiklabs-gcp-00-984d227e1829"
}
