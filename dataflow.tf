resource "google_dataflow_job" "dataflow_job" {
  project               = var.project_id
  region                = var.region
  zone                  = var.zone
  name                  = var.name
  on_delete             = var.on_delete
  max_workers           = var.max_workers
  template_gcs_path     = var.template_gcs_path
  temp_gcs_location     = "gs://${var.temp_gcs_location}/tmp_dir"
  parameters            = var.parameters
  service_account_email = var.service_account_email
  network               = replace(var.network_self_link, "/(.*)/networks/(.*)/", "$2")
  subnetwork = replace(
    var.subnetwork_self_link,
    "/(.*)/regions/(.*)/",
    "regions/$2",
  )
  machine_type     = var.machine_type
  ip_configuration = var.ip_configuration
}