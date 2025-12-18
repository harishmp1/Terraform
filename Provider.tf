terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.14.1"
    }
  }

  # The backend configuration must live inside the terraform block
  #backend "gcs" {
   # bucket = "harish-state-bucket"
    #prefix = "terraform/state"

  }


provider "google" {
  # Project and region must be in quotes
  project = "shruthi-1234"
  region  = "us-east4"
}