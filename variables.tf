variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "us-east1-c"
}

variable "vm_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the VM"
  type        = string
}

variable "disk_image" {
  description = "The boot disk image for the VM"
  type        = string
}

variable "network" {
  description = "The network to attach the VM to"
  type        = string
  default     = "default"
}

