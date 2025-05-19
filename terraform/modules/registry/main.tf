terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_container_registry" "this" {
  name = var.registry_name
  subscription_tier_slug = "starter"
}

output "endpoint" {
  value = digitalocean_container_registry.this.endpoint
}
