resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    network       = var.network
    access_config = {} # Creates ephemeral external IP
  }

  metadata = var.metadata

  tags = var.tags
}

