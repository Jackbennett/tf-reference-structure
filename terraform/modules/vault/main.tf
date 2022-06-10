resource "vault_auth_backend" "users" {
  type = "github"
}

resource "vault_mount" "db" {
  path = "postgres"
  type = "database"
}
