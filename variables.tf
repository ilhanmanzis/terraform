variable "region" {
  description = "Region tempat sumber daya akan dibuat"
  type        = string
  default     = "us-east1"  # Ganti dengan nilai yang sesuai di awal lab
}

variable "zone" {
  description = "Zona tempat sumber daya akan dibuat"
  type        = string
  default     = "us-east1-d"    # Ganti dengan nilai yang sesuai di awal lab
}

variable "project_id" {
  description = "ID Proyek Google Cloud"
  type        = string
  default     = "qwiklabs-gcp-01-8e08402b9a63"  # Ganti dengan Google Cloud Project ID kamu
}
