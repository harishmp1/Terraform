terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.14.1"
    }
  }
}

# 1. Define the Provider
provider "google" {
  project = "shruthi-481814" # Replace with your Project ID
  region  = "us-east4"
}
