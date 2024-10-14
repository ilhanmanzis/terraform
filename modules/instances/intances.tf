resource "google_compute_instance" "tf_instance_1" {
  name         = "tf-instance-1"
  machine_type = "e2-standard-2"  #TAKS 4 Ganti dengan tipe mesin yang sesuai 

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"  # Ganti dengan image boot disk yang sesuai
    }
  }

  network_interface {
    #TAKS 6
    network = "tf-vpc-871526"
    subnetwork = "subnet-01"
    access_config {
      # Allocate a one-to-one NAT IP to the instance
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
  EOT

  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf_instance_2" {
  name         = "tf-instance-2"
  machine_type = "e2-standard-2"  #TAKS 4 Ganti dengan tipe mesin yang sesuai

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"  # Ganti dengan image boot disk yang sesuai
    }
  }

  network_interface {
    #TAKS 6
    network = "tf-vpc-871526"
    subnetwork = "subnet-02"
    access_config {
      # Allocate a one-to-one NAT IP to the instance
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
  EOT

  allow_stopping_for_update = true
}

#TAKS 5
resource "google_compute_instance" "tf-instance-204983" {
  name         = "tf-instance-204983"
  machine_type = "e2-standard-2"  # Ganti dengan tipe mesin yang sesuai

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"  # Ganti dengan image boot disk yang sesuai
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Allocate a one-to-one NAT IP to the instance
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
  EOT

  allow_stopping_for_update = true
}