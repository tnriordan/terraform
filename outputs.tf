output "nginx_containers" {
  value = { for k, v in docker_container.nginx : k => v.id }
}

output "postgres_containers" {
  value = { for k, v in docker_container.postgres : k => v.id }
}

output "nginx_names" {
  value = [for c in docker_container.nginx : c.name]
}

