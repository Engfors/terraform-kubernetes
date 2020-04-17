terraform {
  backend "remote" {
    organization = "engfors"

    workspaces {
      name = "cluster"
    }
  }
}

provider "google" {
  version = "3.10.0"
  project = var.google_project
  region  = var.location.gcp
}

# Enables Compute Engine API
resource "google_project_service" "compute" {
  project            = var.google_project
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

# Enables Kubernetes Engine API
resource "google_project_service" "container" {
  project            = var.google_project
  service            = "container.googleapis.com"
  disable_on_destroy = false
}
