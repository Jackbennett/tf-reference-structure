
resource "postgresql_role" "writer" {
  name    = "writer"
  inherit = false
}

resource "postgresql_grant" "write_table" {
  for_each    = toset(["table", "sequence"])
  object_type = each.key

  privileges = [
    "SELECT",
    "CREATE",
    "UPDATE",
  ]
  schema   = "public"
  database = var.name
  role     = postgresql_role.writer.name
}

resource "vault_database_secret_backend_role" "role" {
  backend = var.vault_backend.path
  name    = postgresql_role.writer.name
  db_name = "postgres" # valt connection name not the db name inside postgres.
  creation_statements = [
    ("${path.module}/roles/create.sql"),
    "GRANT ${postgresql_role.writer.name} TO \"{{name}}\";"
  ]
  renew_statements = [("${path.module}/roles/renew.sql")]
}
