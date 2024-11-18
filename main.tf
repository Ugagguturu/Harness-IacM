# Specify the required Terraform version
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.85" # Use the latest stable version
    }
  }
}

# Provider configuration
provider "google" {
  project = "dev-bivouac-441702-t4" # Replace with your GCP project ID
  region  = "us-east1"         # Replace with your desired region
  zone    = "us-east1-c"       # Replace with your desired zone
}

# Create a Google Compute Engine instance
resource "google_compute_instance" "vm_instance" {
  name         = "example-vm"
  machine_type = "e2-medium" # Replace with your desired machine type

  # Specify the boot disk image
  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-pro-cloud/global/images/ubuntu-pro-1804-bionic-v20220510" # Debian 11 image
    }
  }

  # Specify the network interface
  network_interface {
    network = "default" # Use the default VPC
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

# Output the VM's external IP
output "vm_external_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
  description = "The external IP of the VM instance"
}

