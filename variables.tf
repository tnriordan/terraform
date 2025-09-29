variable "nginx_containers" {
  type = map(object({
    image   = string
    command = list(string)
    ports   = list(string)
  }))
  default = {
    nginx-test-tf-1 = {
      image   = "nginx:latest"
      command = ["bash", "-c", "sleep infinity"]
      ports   = ["8083:80"]
    }
  }
}

variable "postgres_containers" {
  type = map(object({
    image   = string
    command = list(string)
    env     = map(string)
    ports   = list(string)
  }))
  default = {
    pgs-test-tf-1 = {
      image   = "postgres:latest"
      command = ["bash", "-c", "sleep infinity"]
      env     = {
        POSTGRES_USER     = "postgres"
        POSTGRES_PASSWORD = "postgres"
        POSTGRES_DB       = "ansibledb"
      }
      ports   = ["5433:5432"]
    }
  }
}

