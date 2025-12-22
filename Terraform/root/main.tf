terraform {
  backend "gcs" {
    bucket = "shruthi_state_bucket"
    prefix = "terraform/state"
  }
}
# 2. Call the VPC Module
module "custom_vpc" {
  source       = "./modules/vpc"
  
  network_name = "prod-vpc"
  subnet_name  = "prod-subnet-us-central1"
  subnet_cidr  = "10.0.2.0/24"
  region       = "us-central1"
}

# Example: Using the module output to create a firewall rule
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = module.custom_vpc.network_id # Referencing the module output

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

