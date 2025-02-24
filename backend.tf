terraform {
  backend "gcs" {
    bucket  = "state-file-bucket-uk"   # Replace with your bucket name
    prefix  = "terraform/state"      # State file path within the bucket
  }
}

