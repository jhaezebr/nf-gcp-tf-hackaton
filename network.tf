resource "google_compute_network" "vpc_network" {
  name                    = "nf-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = "nf-vpc-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_router" "vpc_router" {
  name   = "nf-vpc-router"
  region = var.gcp_region
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "vpc_nat" {
  name                               = "nf-vpc-nat"
  router                             = google_compute_router.vpc_router.name
  region                             = var.gcp_region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_firewall" "vpc_ssh" {
  name        = "nf-vpc-ssh-fw-rule"
  network     = google_compute_network.vpc_network.id
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
  #source_tags = ["foo"]
  target_tags = ["nextflow"]
}
