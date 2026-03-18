terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {}

variable "filename" {}
variable "message" {}

resource "local_file" "file" {
  filename = "${path.module}/${var.filename}"
  content  = var.message
}

output "file_name" {
  value = local_file.file.filename
}
