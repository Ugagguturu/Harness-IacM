variable "instance_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type to use for the instance"
  type        = string
  default     = "e2-medium"
}

variable "zone" {
  description = "The zone to deploy the instance"
  type        = string
  default     = "us-east1-c"
}

variable "boot_image" {
  description = "The boot disk image"
  type        = string
  default     = "projects/ubuntu-os-cloud/global/images/family/ubuntu-1804-lts"
}

variable "network" {
  description = "The network to attach the instance to"
  type        = string
  default     = "default"
}

variable "metadata" {
  description = "Metadata for the instance"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Network tags for the instance"
  type        = list(string)
  default     = []
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

