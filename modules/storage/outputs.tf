#TAKS 3
output "bucket_name" {
  description = "Nama dari Storage Bucket"
  value       = google_storage_bucket.bucket.name
}
