variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnetwork"
  type        = string
}

variable "subnet_cidr" {
  description = "The IP range for the subnetwork in CIDR notation (e.g., 10.0.1.0/24)"
  type        = string
}

variable "region" {
  description = "The GCP region where the subnetwork will be created"
  type        = string
}