terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.16.0"
    }
    vault = {
      source  = "registry.terraform.io/hashicorp/vault"
      version = "3.5.0"
    }
  }
}

provider "postgresql" {

  database = var.name

  host            = var.host
  port            = var.port
  superuser       = false
  username        = "abject-terra"
  password        = "7kyY5+nice-try="
  sslmode         = "disable"
  connect_timeout = 15
}

resource "postgresql_database" "db" {
  name = var.name
}

resource "vault_database_secret_backend_connection" "postgres" {
  depends_on = [
    postgresql_database.db
  ]
  backend = var.vault_backend.path
  name    = var.name

  postgresql {
    connection_url = "postgres://{{username}}:{{password}}@${var.host}:${var.port}/${var.name}?sslmode=disable"
    username       = "vault"
    password       = "vault_admin"
  }
}
