# Specify the required providers
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.85"
    }
  }
}

# Provider configuration
provider "google" {
  credentials = file("terraform-key.json")
  project = var.project
  region  = var.region
  zone    = var.zone
}

# Create a Google Compute Engine instance
resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.machine_type

  # Specify the boot disk image
  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  # Specify the network interface
  network_interface {
    network = var.network
    access_config {
      # Ephemeral external IP
    }
  }

  # Metadata for the VM
  metadata = {
    startup-script = <<-EOT
      #!/bin/bash
      echo "Hello, World!" > /var/www/html/index.html
    EOT
  }

  tags = ["web", "example"] # Add any relevant tags
}
