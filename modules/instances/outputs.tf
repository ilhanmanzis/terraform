output "instance_names" {
  description = "Nama-nama dari VM instances"
  value       = [google_compute_instance.tf_instance_1.name, google_compute_instance.tf_instance_2.name]
}

output "instance_ids" {
  description = "ID dari VM instances"
  value       = [google_compute_instance.tf_instance_1.id, google_compute_instance.tf_instance_2.id]
}
