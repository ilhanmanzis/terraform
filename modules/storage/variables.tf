#TAKS 3
variable "region" {
  description = "Region tempat storage akan dibuat"
  type        = string
}

variable "zone" {
  description = "Zona tempat storage akan dibuat"
  type        = string
}

variable "project_id" {
  description = "ID Proyek Google Cloud"
  type        = string
}
