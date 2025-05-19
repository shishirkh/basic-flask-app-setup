
variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
  default = "REDACTED"
}

variable "region" {
  default = "nyc3"
}

variable "cluster_name" {
  default = "dev-cluster"
}

variable "node_count" {
  default = 1
}

variable "node_size" {
  default = "s-1vcpu-2gb"
}

variable "registry_name" {
  default = "shishir123-registry"
}
