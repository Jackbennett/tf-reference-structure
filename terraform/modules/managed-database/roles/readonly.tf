
resource "postgresql_role" "ro" {
  name    = "ro"
  inherit = false
}

# grant select on all tables in schema public to "ro";
resource "postgresql_grant" "read" {
  privileges = [
    "SELECT"
  ]
  object_type = "table"
  schema      = "public"
  database    = var.name
  role        = postgresql_role.ro.name
}

resource "vault_database_secret_backend_role" "role" {
  backend = var.vault_backend.path
  name    = postgresql_role.ro.name
  db_name = "postgres"
  creation_statements = [
    ("${path.module}/roles/create.sql"),
    "GRANT ${postgresql_role.ro.name} TO \"{{name}}\";"
  ]
  renew_statements = [("${path.module}/roles/renew.sql")]

}
