terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

resource "local_file" "hello" {
  filename = "${path.module}/hello.txt"
  content  = "Hello, Terraform! 🚀, version 2"
}

