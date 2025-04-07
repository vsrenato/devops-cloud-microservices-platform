variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
  default     = "gke-devops-cluster"
}

variable "network" {
  description = "VPC Network"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Subnetwork Name"
  type        = string
  default     = "default"
}