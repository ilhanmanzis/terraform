terraform {
  required_version = ">= 1.0.0"
  
  #TAKS 3
  backend "gcs" {
    bucket  = "tf-bucket-307671"  # Ganti dengan nama bucket yang valid
    prefix  = "terraform/state"       # Prefix untuk file state di dalam bucket
  }

  #TAKS 2
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"  # Sesuaikan dengan versi provider Google yang kamu gunakan
    }
  }
}

#TAKS 2
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

#TAKS 2
# Referensi ke modul instances
module "instances" {
  source      = "./modules/instances"
  project_id  = var.project_id
  region      = var.region
  zone        = var.zone
}

#TAKS 3
# Referensi ke modul storage (jika diperlukan)
module "storage" {
  source      = "./modules/storage"
  project_id  = var.project_id
  region      = var.region
  zone        = var.zone
}






# TASK 6
# Menambahkan modul jaringan dari Terraform Registry
module "vpc_network" {
  source  = "terraform-google-modules/network/google"
  version = "6.0.0"

  project_id   = var.project_id
  network_name = "tf-vpc-871526"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-east1"
    },
    {
      subnet_name   = "subnet-02"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = "us-east1"
    },
  ]
}


#TAKS 7
resource "google_compute_firewall" "tf_firewall" {
  name    = "tf-firewall"
  network = "tf-vpc-871526"  # Menghubungkan ke VPC yang sudah dibuat

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]  # Mengizinkan semua alamat IP
  direction     = "INGRESS"
  target_tags   = ["http-server"]  # Tag opsional, bisa diatur sesuai kebutuhan
}
