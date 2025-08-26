resource "google_compute_instance" "vpc_vm" {
  name         = "nf-vpc-vm"
  machine_type = "e2-medium"
  zone         = "europe-west1-b"


  tags = ["nextflow"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.vpc_subnetwork.id
  }

  service_account {
    email  = local.vpc_SA.email
    scopes = local.vpc_SA.scopes
  }
}