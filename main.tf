terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

variable "message" {
  description = "Message to write into the hello.txt file"
  type        = string
  default     = "Hello, Terraform!"
}

resource "local_file" "hello" {
  filename = "${path.module}/hello.txt"
  content  = var.message
}

resource "local_file" "app_config" {
  content  = <<EOF
  app_name = "${var.app_name}"
  app_port = "${var.app_port}"
  EOF
  filename = "./${var.app_name}.conf"
}

