terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_kubernetes_cluster" "this" {
  name    = var.cluster_name
  region  = var.region
  version = "1.31.6-do.1" 
  
  node_pool {
    name       = "default"
    size       = var.node_size
    node_count = var.node_count
  }
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.this.kube_config[0].raw_config
}
