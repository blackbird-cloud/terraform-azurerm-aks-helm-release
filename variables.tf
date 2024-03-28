variable "name" {
  type        = string
  description = "Release name."
}

variable "chart" {
  type        = string
  description = "Chart name to be installed. The chart name can be local path, a URL to a chart, or the name of the chart if repository is specified. It is also possible to use the <repository>/<chart> format here if you are running Terraform on a system that the repository has been added to with helm repo add but this is not recommended."
  default     = ""
}

variable "repository" {
  type        = string
  description = "Repository URL where to locate the requested chart."
  default     = null
}

variable "namespace" {
  type        = string
  description = "The namespace to install the release into. Defaults to default."
  default     = "default"
}

variable "create_namespace" {
  type        = bool
  default     = false
  description = "Create the namespace if it does not yet exist. Defaults to false."
}

variable "chart_version" {
  type        = string
  description = "Specify the exact chart version to install. If this is not specified, the latest version is installed. helm_release will not automatically grab the latest release, version must explicitly upgraded when upgrading an installed chart."
  default     = null
}

variable "values" {
  type        = list(string)
  description = "Which values to install for the helm chart."
  default     = []
}

variable "sensitive_values" {
  type        = list(string)
  description = "Which sensitive values to install for the helm chart."
  default     = []
  sensitive   = true
}

variable "repository_username" {
  type        = string
  description = "Username for HTTP basic authentication against the repository."
  default     = null
}

variable "repository_password" {
  type        = string
  description = "Password for HTTP basic authentication against the repository."
  default     = null
  sensitive   = true
}

variable "disable_webhooks" {
  type        = bool
  description = "Prevent hooks from running. Defaults to false."
  default     = false
}

variable "cleanup_on_fail" {
  type        = bool
  default     = false
  description = "Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to true."
}

variable "force_update" {
  type        = bool
  default     = false
  description = "Force resource update through delete/recreate if needed. Defaults to false."
}

variable "description" {
  type        = string
  description = "Set release description attribute (visible in the history)."
  default     = null
}

variable "timeout" {
  type        = number
  description = "Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds."
  default     = 300
}

variable "recreate_pods" {
  type        = bool
  description = "Perform pods restart during upgrade/rollback. Defaults to false."
  default     = false
}

variable "atomic" {
  type        = bool
  description = "If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to false."
  default     = false
}

variable "wait" {
  type        = bool
  description = "Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true."
  default     = true
}

variable "wait_for_jobs" {
  type        = bool
  description = "If wait is enabled, will wait until all Jobs have been completed before marking the release as successful. It will wait for as long as timeout. Defaults to false."
  default     = true
}

variable "cluster_name" {
  type        = string
  description = "The Azure AKS Cluster's name, in which the chart will be installed."
}

variable "resource_group_name" {
  type        = string
  description = "Azure resource group name"
}
