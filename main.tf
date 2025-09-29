terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0.0"
    }
  }
}

provider "docker" {}

resource "docker_container" "nginx" {
  for_each = var.nginx_containers

  name    = each.key
  image   = each.value.image
  command = each.value.command
  restart = "always"

  dynamic "ports" {
    for_each = each.value.ports
    content {
      internal = tonumber(split(":", ports.value)[1])
      external = tonumber(split(":", ports.value)[0])
    }
  }
}

# One-off container, not tied to variables.tf
resource "docker_container" "nginx_extra" {
  name  = "nginx-test-tf-2"
  image = "nginx:stable"

  ports {
    internal = 80
    external = 8090
  }
}

resource "docker_container" "postgres" {
  for_each = var.postgres_containers

  name    = each.key
  image   = each.value.image
  command = each.value.command
  restart = "always"

  env = [for k, v in each.value.env : "${k}=${v}"]

  dynamic "ports" {
    for_each = each.value.ports
    content {
      internal = tonumber(split(":", ports.value)[1])
      external = tonumber(split(":", ports.value)[0])
    }
  }
}

