variable "project_id" {
  type        = string
  description = "The project in which the resource belongs. If it is not provided, the provider project is used."
    default = ""
}

variable "name" {
  type        = string
  description = "The name of the dataflow job"
  default = ""
}

variable "template_gcs_path" {
  type        = string
  description = "The GCS path to the Dataflow job template."
  default = ""
}

variable "temp_gcs_location" {
  type        = string
  description = "A writeable location on GCS for the Dataflow job to dump its temporary data."
  default = ""
}

variable "parameters" {
  type        = map(string)
  description = "Key/Value pairs to be passed to the Dataflow job (as used in the template)."
  default     = {
    inputSubscription = ""
    stagingLocation = "" 
    outputDirectory = ""
    outputFilenamePrefix = ""
    outputFilenameSuffix = ""
    numShards = "1000"
    windowDuration = "1s"
  }
}

variable "max_workers" {
  type        = number
  description = " The number of workers permitted to work on the job. More workers may improve processing speed at additional cost."
  default     = 15
}

variable "on_delete" {
  type        = string
  description = "One of drain or cancel. Specifies behavior of deletion during terraform destroy. The default is cancel."
  default     = "cancel"
}

variable "region" {
  type        = string
  description = "The region in which the created job should run. Also determines the location of the staging bucket if created."
  default     = "us-west1"
}

variable "zone" {
  type        = string
  description = "The zone in which the created job should run."
  default     = "us-west1-a"
}

variable "service_account_email" {
  type        = string
  description = "The Service Account email that will be used to identify the VMs in which the jobs are running"
  default     = "*@cloud.iam.gserviceaccount.com"
}

variable "subnetwork_self_link" {
  type        = string
  description = "The subnetwork self link to which VMs will be assigned."
  default     = "https://www.googleapis.com/compute/v1/projects/..."
}

variable "network_self_link" {
  type        = string
  description = "The network self link to which VMs will be assigned."
  default     = "default"
}

variable "machine_type" {
  type        = string
  description = "The machine type to use for the job."
  default     = "n1-highmem-16"
}

variable "ip_configuration" {
  type        = string
  description = "The configuration for VM IPs. Options are 'WORKER_IP_PUBLIC' or 'WORKER_IP_PRIVATE'." 
  default     = "WORKER_IP_PRIVATE"
}
