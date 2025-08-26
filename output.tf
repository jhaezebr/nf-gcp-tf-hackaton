output "bucket_name" {
  value = google_storage_bucket.demo_bucket.name
}

output "network_name" {
  value = google_compute_network.vpc_network.name
}

output "subnetwork_name" {
  value = google_compute_subnetwork.vpc_subnetwork.name
}