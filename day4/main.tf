terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

variable "container_config" {
  type = list(object({
    name = string
    port = number
  }))
}

module "containers" {
  source = "./modules/nginx_container"

  for_each = {
    for c in var.container_config : c.name => c
  }

  container_name = each.value.name
  container_port = each.value.port
  image_name     = "nginx:latest"
}

output "container_urls" {
  value = [
    for c in var.container_config :
    "http://localhost:${c.port}"
  ]
}
