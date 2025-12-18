resource "google_storage_bucket" "my_bucket" {
  name          = "Shruthi-bucket" # Replace with your actual bucket name
  location      = "US-east4"
  force_destroy = true

  # This is the labels block you just added
  labels = {
    environment = "test"
    managed_by  = "terraform"
  }

  uniform_bucket_level_access = true
}
# 1. Define the Network (VPC)
resource "google_compute_network" "vpc_network" {
  name                    = "shruthi-network"
  auto_create_subnetworks = true
}

# 2. Add a Firewall Rule (to allow SSH access)
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# 3. Create the VM Instance
resource "google_compute_instance" "vm_instance" {
  name         = "my-first-vm"
  machine_type = "e2-micro" # Free Tier eligible
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
      # Leaving this empty gives the VM a Public IP
    }
  }
}