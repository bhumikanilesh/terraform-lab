terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

variable "message" {
  default = "Hello from Terraform"
}

resource "local_file" "hello" {
  filename = "${path.module}/hello.txt"
  content  = var.message
}

output "file_path" {
  value = local_file.hello.filename
}
