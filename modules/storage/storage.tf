#TAKS 3
resource "google_storage_bucket" "bucket" {
  name          = "tf-bucket-307671"  # Ganti dengan nama bucket unik
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true
}
