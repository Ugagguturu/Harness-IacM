terraform {
  backend "gcs" {
    bucket  = "myiacbucketharness"   # Replace with your bucket name
    prefix  = "terraform/state"      # State file path within the bucket
    project = "dev-bivouac-441702-t4" # Replace with your GCP project ID
  }
}

