output "network_id" {
  description = "The ID of the VPC being created"
  value       = google_compute_network.vpc.id
}

output "network_self_link" {
  description = "The URI of the VPC being created"
  value       = google_compute_network.vpc.self_link
}

output "subnet_id" {
  description = "The ID of the subnetwork being created"
  value       = google_compute_subnetwork.subnet.id
}

output "subnet_ip_range" {
  description = "The IP range of the created subnetwork"
  value       = google_compute_subnetwork.subnet.ip_cidr_range
}