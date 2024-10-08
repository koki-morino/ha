terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.0.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.32.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

variable "project_id" {}

resource "google_storage_bucket" "default" {
  name          = "vm-images-bucket"
  force_destroy = true
  location      = "ASIA-NORTHEAST1"
  storage_class = "REGIONAL"
}

output "bucket_id" {
  value = google_storage_bucket.default.id
}
