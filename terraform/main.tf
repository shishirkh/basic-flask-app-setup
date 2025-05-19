terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

module "doks" {
  source = "./modules/doks"
  cluster_name = var.cluster_name
  region       = var.region
  node_count   = var.node_count
  node_size    = var.node_size
}

module "registry" {
  source = "./modules/registry"
  registry_name = var.registry_name
}

output "kubeconfig" {
  value     = module.doks.kubeconfig
  sensitive = true
}

output "registry_url" {
  value = module.registry.endpoint
}
